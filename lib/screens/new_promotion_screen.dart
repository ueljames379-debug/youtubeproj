import 'package:flutter/material.dart';
import '../models/campaign_draft.dart';
import '../widgets/campaigns/promotion_app_bar.dart';
import '../widgets/campaigns/platform_selector.dart';
import '../widgets/campaigns/content_url_field.dart';
import '../widgets/campaigns/campaign_goal_selector.dart';
import '../widgets/campaigns/target_amount_selector.dart';
import '../widgets/campaigns/watch_time_slider.dart';
import '../widgets/campaigns/estimated_cost_card.dart';
import '../widgets/campaigns/launch_campaign_button.dart';

class NewPromotionScreen extends StatefulWidget {
  const NewPromotionScreen({super.key});

  @override
  State<NewPromotionScreen> createState() =>
      _NewPromotionScreenState();
}

class _NewPromotionScreenState extends State<NewPromotionScreen> {
  // ── Form state ──
  CampaignPlatform _selectedPlatform = CampaignPlatform.youtube;
  CampaignGoal _selectedGoal = CampaignGoal.subscribers;
  int _targetAmount = 300;
  int _watchTimeSeconds = 60;
  final TextEditingController _urlController = TextEditingController();
  String? _validationError;

  // ── Derived cost ──
  int get _estimatedCost => _targetAmount * coinsPerUnit;

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  bool _validate() {
    if (_urlController.text.trim().isEmpty) {
      setState(() => _validationError = 'Please enter a content URL.');
      return false;
    }
    final uri = Uri.tryParse(_urlController.text.trim());
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      setState(
              () => _validationError = 'Please enter a valid URL.');
      return false;
    }
    setState(() => _validationError = null);
    return true;
  }

  void _onLaunchCampaign() {
    if (!_validate()) return;

    final draft = CampaignDraft(
      platform: _selectedPlatform,
      contentUrl: _urlController.text.trim(),
      goal: _selectedGoal,
      targetAmount: _targetAmount,
      watchTimeSeconds: _watchTimeSeconds,
    );

    // TODO: Pass draft to CampaignController / Repository
    debugPrint('Launching campaign: $draft');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Campaign launched successfully!'),
        backgroundColor: Color(0xFF7C4DFF),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: SafeArea(
        child: Column(
          children: [

            // ── Fixed App Bar ──
            PromotionAppBar(
              onBack: () => Navigator.pop(context),
            ),

            // ── Scrollable Form ──
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ── Form Card ──
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF12121A),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.white12,
                          width: 0.8,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // ── Platform ──
                          PlatformSelector(
                            selected: _selectedPlatform,
                            onChanged: (p) =>
                                setState(() => _selectedPlatform = p),
                          ),

                          const SizedBox(height: 20),

                          // ── Content URL ──
                          ContentUrlField(
                            controller: _urlController,
                            errorText: _validationError,
                          ),

                          const SizedBox(height: 20),

                          // ── Campaign Goal ──
                          CampaignGoalSelector(
                            selected: _selectedGoal,
                            onChanged: (g) =>
                                setState(() => _selectedGoal = g),
                          ),

                          const SizedBox(height: 20),

                          // ── Target Amount ──
                          TargetAmountSelector(
                            amount: _targetAmount,
                            onDecrement: () {
                              if (_targetAmount > minTargetAmount) {
                                setState(() => _targetAmount -= 50);
                              }
                            },
                            onIncrement: () {
                              if (_targetAmount < maxTargetAmount) {
                                setState(() => _targetAmount += 50);
                              }
                            },
                          ),

                          const SizedBox(height: 20),

                          // ── Watch Time ──
                          WatchTimeSlider(
                            value: _watchTimeSeconds,
                            min: minWatchTime,
                            max: maxWatchTime,
                            onChanged: (v) =>
                                setState(() => _watchTimeSeconds = v),
                          ),

                          const SizedBox(height: 8),

                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ── Estimated Cost Card ──
                    EstimatedCostCard(
                      estimatedCost: _estimatedCost,
                      coinsPerUnit: coinsPerUnit,
                    ),

                    const SizedBox(height: 16),

                    // ── Launch Button ──
                    LaunchCampaignButton(
                      onTap: _onLaunchCampaign,
                    ),

                    const SizedBox(height: 24),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}