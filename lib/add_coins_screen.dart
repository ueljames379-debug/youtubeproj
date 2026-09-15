import 'package:flutter/material.dart';

class AddCoinsScreen extends StatefulWidget {
  final int currentBalance;

  const AddCoinsScreen({
    super.key,
    required this.currentBalance,
  });

  @override
  State<AddCoinsScreen> createState() => _AddCoinsScreenState();
}

class _AddCoinsScreenState extends State<AddCoinsScreen> {
  int _selectedPackageIndex = 1;
  int _selectedPaymentIndex = 0;

  final List<_CoinPackage> _packages = const [
    _CoinPackage(coins: 500, price: 4.99, label: ''),
    _CoinPackage(coins: 1000, price: 8.99, label: ''),
    _CoinPackage(coins: 2500, price: 19.99, label: ''),
    _CoinPackage(coins: 5000, price: 34.99, label: 'BEST VALUE'),
    _CoinPackage(coins: 10000, price: 59.99, label: 'MOST POPULAR'),
  ];

  final List<_PaymentMethod> _paymentMethods = const [
    _PaymentMethod(icon: Icons.credit_card_outlined, label: 'Credit / Debit Card'),
    _PaymentMethod(icon: Icons.account_balance_wallet_outlined, label: 'PayPal'),
    _PaymentMethod(icon: Icons.phone_iphone_outlined, label: 'Apple Pay'),
  ];

  _CoinPackage get _selectedPackage => _packages[_selectedPackageIndex];

  void _onConfirmPurchase() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF12121A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Confirm Purchase',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          'Buy ${_formatCoins(_selectedPackage.coins)} Coins for \$${_selectedPackage.price.toStringAsFixed(2)}?',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white38),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${_formatCoins(_selectedPackage.coins)} Coins added successfully!',
                  ),
                  backgroundColor: const Color(0xFF7C4DFF),
                ),
              );
              Navigator.pop(context);
            },
            child: const Text(
              'Confirm',
              style: TextStyle(
                color: Color(0xFF9C6FFF),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatCoins(int coins) {
    return coins.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]},',
    );
  }

  String _formatBalance(int balance) {
    return balance.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]},',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: SafeArea(
        child: Column(
          children: [

            // ── App Bar ──
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF0A0A0F),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withOpacity(0.08),
                    width: 0.8,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white70,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    'Add Coins',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            // ── Scrollable Content ──
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ── Current Balance Card ──
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFF12121A),
                            Color(0xFF1C1535),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.white12,
                          width: 0.8,
                        ),
                      ),
                      child: Row(
                        children: [

                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFF7C4DFF).withOpacity(0.2),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF7C4DFF).withOpacity(0.4),
                              ),
                            ),
                            child: const Icon(
                              Icons.toll_outlined,
                              color: Color(0xFF9C6FFF),
                              size: 24,
                            ),
                          ),

                          const SizedBox(width: 14),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'YOUR BALANCE',
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.3,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    _formatBalance(widget.currentBalance),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  const Text(
                                    'Coins',
                                    style: TextStyle(
                                      color: Color(0xFF9C6FFF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── Select Package label ──
                    const Text(
                      'SELECT A PACKAGE',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.3,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ── Coin Packages Grid ──
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _packages.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) {
                        final package = _packages[index];
                        final isSelected = _selectedPackageIndex == index;

                        // Last item spans full width
                        if (index == _packages.length - 1 &&
                            _packages.length % 2 != 0) {
                          return const SizedBox.shrink();
                        }

                        return GestureDetector(
                          onTap: () =>
                              setState(() => _selectedPackageIndex = index),
                          child: _CoinPackageCard(
                            package: package,
                            isSelected: isSelected,
                            formatCoins: _formatCoins,
                          ),
                        );
                      },
                    ),

                    // ── Last odd package full width ──
                    if (_packages.length % 2 != 0) ...[
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () => setState(
                              () => _selectedPackageIndex = _packages.length - 1,
                        ),
                        child: _CoinPackageCard(
                          package: _packages.last,
                          isSelected:
                          _selectedPackageIndex == _packages.length - 1,
                          formatCoins: _formatCoins,
                          fullWidth: true,
                        ),
                      ),
                    ],

                    const SizedBox(height: 24),

                    // ── Payment Method label ──
                    const Text(
                      'PAYMENT METHOD',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.3,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ── Payment Methods ──
                    ...List.generate(_paymentMethods.length, (index) {
                      final method = _paymentMethods[index];
                      final isSelected = _selectedPaymentIndex == index;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: GestureDetector(
                          onTap: () =>
                              setState(() => _selectedPaymentIndex = index),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF7C4DFF).withOpacity(0.1)
                                  : const Color(0xFF12121A),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF7C4DFF)
                                    : Colors.white12,
                                width: isSelected ? 1.5 : 0.8,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  method.icon,
                                  color: isSelected
                                      ? const Color(0xFF9C6FFF)
                                      : Colors.white38,
                                  size: 22,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  method.label,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.white60,
                                    fontSize: 14,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                                if (isSelected)
                                  const Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF7C4DFF),
                                    size: 20,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),

                    const SizedBox(height: 24),

                    // ── Confirm Button ──
                    GestureDetector(
                      onTap: _onConfirmPurchase,
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF7C4DFF),
                              Color(0xFF5C2EE0),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF7C4DFF).withOpacity(0.4),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.toll_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Buy ${_formatCoins(_selectedPackage.coins)} Coins'
                                  ' — \$${_selectedPackage.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ── Security note ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.lock_outline,
                          color: Colors.white24,
                          size: 14,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Secure payment · Instant delivery',
                          style: TextStyle(
                            color: Colors.white24,
                            fontSize: 12,
                          ),
                        ),
                      ],
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

// ── Coin Package Card Widget ──
class _CoinPackageCard extends StatelessWidget {
  final _CoinPackage package;
  final bool isSelected;
  final String Function(int) formatCoins;
  final bool fullWidth;

  const _CoinPackageCard({
    required this.package,
    required this.isSelected,
    required this.formatCoins,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFF7C4DFF).withOpacity(0.12)
            : const Color(0xFF12121A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected
              ? const Color(0xFF7C4DFF)
              : Colors.white12,
          width: isSelected ? 1.5 : 0.8,
        ),
      ),
      child: Stack(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                children: [
                  const Icon(
                    Icons.toll_outlined,
                    color: Color(0xFF9C6FFF),
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    formatCoins(package.coins),
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4),

              const Text(
                'Coins',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 11,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                '\$${package.price.toStringAsFixed(2)}',
                style: TextStyle(
                  color: isSelected
                      ? const Color(0xFF9C6FFF)
                      : Colors.white54,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),

            ],
          ),

          // ── Badge ──
          if (package.label.isNotEmpty)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: package.label == 'BEST VALUE'
                      ? const Color(0xFF00C853)
                      : const Color(0xFFE53935),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  package.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),

        ],
      ),
    );
  }
}

// ── Data classes ──
class _CoinPackage {
  final int coins;
  final double price;
  final String label;

  const _CoinPackage({
    required this.coins,
    required this.price,
    required this.label,
  });
}

class _PaymentMethod {
  final IconData icon;
  final String label;

  const _PaymentMethod({
    required this.icon,
    required this.label,
  });
}