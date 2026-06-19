import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/portfolio_data.dart';
import '../widgets/shared_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(child: _buildHeader()),
            SliverToBoxAdapter(child: _buildTabBar()),
          ],
          body: TabBarView(
            controller: _tabCtrl,
            children: [
              _AboutTab(),
              _SkillsTab(),
              _ExperienceTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
      child: Column(
        children: [
          // Avatar + name
          Row(
            children: [
              const AvatarWidget(size: 72, initials: "AM"),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      PortfolioData.name,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      PortfolioData.title,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppTheme.textSecondary,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const StatusDot(color: AppTheme.accentGreen),
                        const SizedBox(width: 6),
                        Text(
                          "Open to opportunities",
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: AppTheme.accentGreen,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Info chips
          Row(
            children: [
              _infoChip(Icons.location_on_outlined, PortfolioData.location),
              const SizedBox(width: 10),
              _infoChip(Icons.work_outline_rounded, "Full-Time"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.surfaceAlt,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.divider),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: AppTheme.textMuted),
          const SizedBox(width: 5),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceAlt,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.divider),
      ),
      child: TabBar(
        controller: _tabCtrl,
        indicator: BoxDecoration(
          gradient: AppTheme.accentGradient,
          borderRadius: BorderRadius.circular(10),
        ),
        indicatorPadding: const EdgeInsets.all(4),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelStyle: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.inter(fontSize: 13),
        labelColor: Colors.white,
        unselectedLabelColor: AppTheme.textMuted,
        tabs: const [
          Tab(text: "About"),
          Tab(text: "Skills"),
          Tab(text: "Experience"),
        ],
      ),
    );
  }
}

// ─── About Tab ────────────────────────────────────────────────────────────────
class _AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader("About Me"),
          GlassCard(
            child: Text(
              PortfolioData.about,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppTheme.textSecondary,
                height: 1.75,
              ),
            ),
          ),
          const SizedBox(height: 28),
          const SectionHeader("Personal Details"),
          GlassCard(
            child: Column(
              children: [
                _detail(Icons.person_outline_rounded, "Name", PortfolioData.name),
                _divider(),
                _detail(Icons.alternate_email_rounded, "Email", PortfolioData.email),
                _divider(),
                _detail(Icons.phone_outlined, "Phone", PortfolioData.phone),
                _divider(),
                _detail(Icons.location_on_outlined, "Location", PortfolioData.location),
                _divider(),
                _detail(Icons.language_outlined, "Website", PortfolioData.website),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const SectionHeader("Interests"),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              "Open Source",
              "System Design",
              "UI/UX Design",
              "Developer Tools",
              "Performance",
              "Accessibility",
            ].map((t) => TechTag(t)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _detail(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppTheme.accent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 15, color: AppTheme.accent),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: AppTheme.textMuted,
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Container(
        height: 1,
        color: AppTheme.divider,
      );
}

// ─── Skills Tab ───────────────────────────────────────────────────────────────
class _SkillsTab extends StatelessWidget {
  static const _categoryColors = {
    SkillCategory.mobile: Color.fromARGB(255, 8, 3, 105),
    SkillCategory.frontend: AppTheme.accentWarm,
    SkillCategory.backend: AppTheme.accentGreen,
    SkillCategory.design: Color(0xFFE2A84B),
  };

  static const _categoryLabels = {
    SkillCategory.mobile: "Mobile",
    SkillCategory.frontend: "Frontend",
    SkillCategory.backend: "Backend",
    SkillCategory.design: "Design",
  };

  @override
  Widget build(BuildContext context) {
    final grouped = <SkillCategory, List<Skill>>{};
    for (final s in PortfolioData.skills) {
      grouped.putIfAbsent(s.category, () => []).add(s);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: SkillCategory.values.map((cat) {
          final skills = grouped[cat];
          if (skills == null || skills.isEmpty) return const SizedBox.shrink();
          final color = _categoryColors[cat]!;
          final label = _categoryLabels[cat]!;
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: color.withOpacity(0.25), width: 1),
                      ),
                      child: Text(
                        label,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                GlassCard(
                  child: Column(
                    children: skills
                        .map((s) => SkillBar(
                              name: s.name,
                              level: s.level,
                              color: color,
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ─── Experience Tab ───────────────────────────────────────────────────────────
class _ExperienceTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader("Work Experience"),
          ...PortfolioData.experiences.asMap().entries.map((entry) {
            final i = entry.key;
            final exp = entry.value;
            final isLast = i == PortfolioData.experiences.length - 1;
            return _ExpCard(exp: exp, isLast: isLast);
          }),
        ],
      ),
    );
  }
}

class _ExpCard extends StatelessWidget {
  final Experience exp;
  final bool isLast;

  const _ExpCard({required this.exp, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppTheme.accentGradient,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 1.5,
                    color: AppTheme.divider,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          // Card
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
              child: GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            exp.role,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppTheme.accent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            exp.period,
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              color: AppTheme.accent,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      exp.company,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppTheme.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      exp.description,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppTheme.textMuted,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children:
                          exp.tech.map((t) => TechTag(t, small: true)).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
