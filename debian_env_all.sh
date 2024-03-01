#!/bin/bash
# debian-all-env-conf
apt update
apt install apt-transport-https -y
rm -rf /etc/apt/sources.list
echo "deb http://ftp.debian.org/debian bookworm main non-free-firmware" >> /etc/apt/sources.list
echo "deb https://ftp.debian.org/debian/ bookworm-updates bookworm main" >> /etc/apt/sources.list
echo "deb https://security.debian.org/debian-security/ bookworm-security bookworm main" >> /etc/apt/sources.list
apt update && apt upgrade -y
apt install -y unhide unhide-gui unhide-tcp unattended-upgrades tiger tcpd setools sepol-utils nmap arpwatch mctrans auditd syslog-ng lynis debsecan unzip debian-security-support chkrootkit rkhunter checkpolicy apparmor-profiles apparmor-profiles-extra apticron arpalert debdelta apt-listdifferences apt-listbugs tiger

wget https://github.com/ovh/debian-cis/archive/refs/heads/master.zip
unzip master.zip
mv debian-cis cis
chown root:root cis
cd ~/cis
cp debian/default /etc/default/cis-hardening
sed -i "s#CIS_LIB_DIR=.*#CIS_LIB_DIR='$(pwd)'/lib#" /etc/default/cis-hardening
sed -i "s#CIS_CHECKS_DIR=.*#CIS_CHECKS_DIR='$(pwd)'/bin/hardening#" /etc/default/cis-hardening
sed -i "s#CIS_CONF_DIR=.*#CIS_CONF_DIR='$(pwd)'/etc#" /etc/default/cis-hardening
sed -i "s#CIS_TMP_DIR=.*#CIS_TMP_DIR='$(pwd)'/tmp#" /etc/default/cis-hardening
./bin/hardening.sh --audit
sleep 1
cd ~/cis/etc/conf.d
sed -i 's/=audit/=enabled/g' 4.1.3_record_date_time_edit.cfg
sed -i 's/=audit/=enabled/g' 4.1.4_record_user_group_edit.cfg
sed -i 's/=audit/=enabled/g' 4.1.5_record_network_edit.cfg
sed -i 's/=audit/=enabled/g' 4.1.6_record_mac_edit.cfg
sed -i 's/=audit/=enabled/g' 4.1.7_record_login_logout.cfg
sed -i 's/=audit/=enabled/g' 4.1.8_record_session_init.cfg
sed -i 's/=audit/=enabled/g' 4.1.9_record_dac_edit.cfg
sed -i 's/=audit/=enabled/g' 4.1.10_record_failed_access_file.cfg
sed -i 's/=audit/=enabled/g' 4.1.11_record_privileged_commands.cfg
sed -i 's/=audit/=enabled/g' 4.1.12_record_successful_mount.cfg
sed -i 's/=audit/=enabled/g' 4.1.13_record_file_deletions.cfg
sed -i 's/=audit/=enabled/g' 4.2.3_logs_permissions.cfg
sed -i 's/=audit/=enabled/g' 4.1.14_record_sudoers_edit.cfg
sed -i 's/=audit/=enabled/g' 4.1.15_record_sudo_usage.cfg
sed -i 's/=audit/=enabled/g' 4.1.16_record_kernel_modules.cfg
sed -i 's/=audit/=enabled/g' 5.1.1_enable_cron.cfg
sed -i 's/=audit/=enabled/g' 5.1.8_cron_users.cfg
sed -i 's/=audit/=enabled/g' 5.1.2_crontab_perm_ownership.cfg
sed -i 's/=audit/=enabled/g' 5.1.3_cron_hourly_perm_ownership.cfg
sed -i 's/=audit/=enabled/g' 5.1.4_cron_daily_perm_ownership.cfg
sed -i 's/=audit/=enabled/g' 5.1.5_cron_weekly_perm_ownership.cfg
sed -i 's/=audit/=enabled/g' 5.1.6_cron_monthly_perm_ownership.cfg
sed -i 's/=audit/=enabled/g' 5.1.7_cron_d_perm_ownership.cfg
sed -i 's/=audit/=enabled/g' 5.2.5_sshd_loglevel.cfg
sed -i 's/=audit/=enabled/g' 5.2.6_disable_x11_forwarding.cfg
sed -i 's/=audit/=enabled/g' 5.2.7_sshd_maxauthtries.cfg
sed -i 's/=audit/=enabled/g' 5.2.11_disable_sshd_permitemptypasswords.cfg
#syslog
sed -i 's/=audit/=enabled/g' 4.1.17_freeze_auditd_conf.cfg
sed -i 's/=audit/=enabled/g' 4.2.1.1_install_syslog-ng.cfg
sed -i 's/=audit/=enabled/g' 4.2.1.2_enable_syslog-ng.cfg
sed -i 's/=audit/=enabled/g' 4.2.1.3_configure_syslog-ng.cfg
sed -i 's/=audit/=enabled/g' 4.2.1.4_syslog_ng_logfiles_perm.cfg
#log
sed -i 's/=audit/=enabled/g' 4.1.16_record_kernel_modules.cfg
sed -i 's/=audit/=enabled/g' 4.1.15_record_sudo_usage.cfg
sed -i 's/=audit/=enabled/g' 4.1.14_record_sudoers_edit.cfg
sed -i 's/=audit/=enabled/g' 4.1.13_record_file_deletions.cfg
sed -i 's/=audit/=enabled/g' 4.1.12_record_successful_mount.cfg
sed -i 's/=audit/=enabled/g' 4.1.11_record_privileged_commands.cfg
sed -i 's/=audit/=enabled/g' 4.1.10_record_failed_access_file.cfg
sed -i 's/=audit/=enabled/g' 4.1.9_record_dac_edit.cfg
sed -i 's/=audit/=enabled/g' 4.1.8_record_session_init.cfg
sed -i 's/=audit/=enabled/g' 4.1.7_record_login_logout.cfg
sed -i 's/=audit/=enabled/g' 4.1.6_record_mac_edit.cfg
sed -i 's/=audit/=enabled/g' 4.1.5_record_network_edit.cfg
sed -i 's/=audit/=enabled/g' 4.1.4_record_user_group_edit.cfg
sed -i 's/=audit/=enabled/g' 4.1.3_record_date_time_edit.cfg
sed -i 's/=audit/=enabled/g' 4.1.2.3_keep_all_audit_logs.cfg
sed -i 's/=audit/=enabled/g' 4.1.2.2_halt_when_audit_log_full.cfg
sed -i 's/=audit/=enabled/g' 4.1.2.1_audit_log_storage.cfg
sed -i 's/=audit/=enabled/g' 4.1.1.4_audit_backlog_limit.cfg
sed -i 's/=audit/=enabled/g' 4.1.1.3_audit_bootloader.cfg
sed -i 's/=audit/=enabled/g' 1.3.3_logfile_sudo.cfg
sed -i 's/=audit/=enabled/g' 4.1.1.1_install_auditd.cfg
sed -i 's/=audit/=enabled/g' 4.1.1.2_enable_auditd.cfg
sed -i 's/=audit/=enabled/g' 1.6.4_restrict_core_dumps.cfg
#protocol
sed -i 's/=audit/=enabled/g' 3.4.3_disable_rds.cfg
sed -i 's/=audit/=enabled/g' 3.4.4_disable_tipc.cfg
sed -i 's/=audit/=enabled/g' 3.4.2_disable_sctp.cfg
sed -i 's/=audit/=enabled/g' 3.4.1_disable_dccp.cfg
#ipv6
sed -i 's/=audit/=enabled/g' 3.3.9_disable_ipv6_router_advertisement.cfg
sed -i 's/=audit/=enabled/g' 3.3.7_enable_source_route_validation.cfg
sed -i 's/=audit/=enabled/g' 3.3.8_enable_tcp_syn_cookies.cfg
sed -i 's/=audit/=enabled/g' 3.3.4_log_martian_packets.cfg
sed -i 's/=audit/=enabled/g' 3.3.3_disable_secure_icmp_redirect.cfg
sed -i 's/=audit/=enabled/g' 3.3.3_disable_secure_icmp_redirect.cfg
sed -i 's/=audit/=enabled/g' 3.3.1_disable_source_routed_packets.cfg
sed -i 's/=audit/=enabled/g' 3.2.1_disable_send_packet_redirects.cfg
sed -i 's/=audit/=enabled/g' 3.1.1_disable_ipv6.cfg
sed -i 's/=audit/=enabled/g' 2.2.15_mta_localhost.cfg
##apparmor
sed -i 's/=audit/=enabled/g' 1.7.1.1_install_apparmor.cfg
sed -i 's/=audit/=enabled/g' 1.7.1.2_enable_apparmor.cfg
sed -i 's/=audit/=enabled/g' 1.7.1.3_enforce_or_complain_apparmor.cfg
sed -i 's/=audit/=enabled/g' 1.7.1.4_enforcing_apparmor.cfg
##tripwire
sed -i 's/=audit/=enabled/g' 1.4.2_tripwire_cron.cfg
##remotedevice
sed -i 's/=audit/=enabled/g' 1.1.23_disable_usb_storage.cfg
sed -i 's/=audit/=enabled/g' 1.1.20_removable_device_noexec.cfg
sed -i 's/=audit/=enabled/g' 1.1.19_removable_device_nosuid.cfg
sed -i 's/=audit/=enabled/g' 1.1.18_removable_device_nodev.cfg
sed -i 's/=audit/=enabled/g' 1.1.17_run_shm_noexec.cfg
#fs mode
sed -i 's/=audit/=enabled/g' 1.1.1.6_disable_udf.cfg
sed -i 's/=audit/=enabled/g' 1.1.1.4_disable_hfsplus.cfg
sed -i 's/=audit/=enabled/g' 1.1.1.3_disable_hfs.cfg
sed -i 's/=audit/=enabled/g' 1.1.1.2_disable_jffs2.cfg
sed -i 's/=audit/=enabled/g' 1.1.1.1_disable_freevxfs.cfg
cd ~/cis
./bin/hardening.sh --apply
cd ~/
rm -rf cis
history -c 2&>/dev/null
