Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E59D149C
	for <lists+nouveau@lfdr.de>; Wed,  9 Oct 2019 18:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF126EA19;
	Wed,  9 Oct 2019 16:52:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE70B6EA15
 for <nouveau@lists.freedesktop.org>; Wed,  9 Oct 2019 16:52:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BBB5C72162; Wed,  9 Oct 2019 16:52:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 09 Oct 2019 16:52:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: neenaoffline@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-111940-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111940] New: frequent timeout warnings during normal
 operation
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0957025489=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0957025489==
Content-Type: multipart/alternative; boundary="15706399262.B7748CD.26115"
Content-Transfer-Encoding: 7bit


--15706399262.B7748CD.26115
Date: Wed, 9 Oct 2019 16:52:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111940

            Bug ID: 111940
           Summary: frequent timeout warnings during normal operation
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: Driver/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: neenaoffline@gmail.com
        QA Contact: xorg-team@lists.x.org

Created attachment 145686
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145686&action=3Dedit
dmesg output

I'm using a Dell 5540 which has an Nvidia Quadro T1000. I see frequent nouv=
eau
timeout warnings on dmesg. This shows up on gnome as a "Something has gone
wrong" pop up as well.

I am running Fedora 31 Beta. I have attached the output of lspci, lsmod and
dmesg. The relevant lines on dmesg look like:

[410260.350921] nouveau 0000:01:00.0: timeout
[410260.351057] WARNING: CPU: 4 PID: 199248 at
drivers/gpu/drm/nouveau/nvkm/subdev/bar/g84.c:35 g84_bar_flush+0xcf/0xe0
[nouveau]
[410260.351059] Modules linked in: uas usb_storage rc_cec
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_REJECT nf_reject_=
ipv6
ip6t_rpfilter ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_br=
oute
ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_=
nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 ebtable_filter ebtables ip6table_filter ip6_tables
iptable_filter ip_tables rfcomm snd_usb_audio snd_usbmidi_lib snd_rawmidi c=
cm
libcrc32c ip_set nfnetlink cmac bnep sunrpc vfat fat wacom hid_multitouch
dell_rbtn iTCO_wdt iTCO_vendor_support sof_pci_dev snd_sof_intel_hda_common
snd_sof_intel_hda snd_sof_intel_byt snd_sof_intel_ipc snd_sof
snd_sof_xtensa_dsp snd_soc_skl x86_pkg_temp_thermal intel_powerclamp
snd_soc_hdac_hda coretemp snd_hda_ext_core snd_soc_skl_ipc snd_soc_sst_ipc
kvm_intel snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_codec_hdmi
snd_soc_acpi dell_laptop kvm snd_soc_core mei_hdcp
[410260.351096]  snd_hda_codec_realtek mei_wdt dell_smm_hwmon
snd_hda_codec_generic intel_rapl_msr irqbypass ledtrig_audio snd_compress
ac97_bus snd_pcm_dmaengine snd_hda_intel crct10dif_pclmul crc32_pclmul
snd_hda_codec iwlmvm ghash_clmulni_intel snd_hda_core intel_cstate intel_un=
core
snd_hwdep intel_rapl_perf mac80211 joydev dell_wmi snd_seq dell_smbios dcdb=
as
snd_seq_device wmi_bmof intel_wmi_thunderbolt dell_wmi_descriptor snd_pcm
libarc4 uvcvideo btusb btrtl snd_timer btbcm i2c_i801 btintel videobuf2_vma=
lloc
videobuf2_memops iwlwifi snd videobuf2_v4l2 bluetooth videobuf2_common
rtsx_pci_ms cfg80211 soundcore videodev memstick thunderbolt mei_me
ecdh_generic rfkill idma64 mc mei ecc processor_thermal_device ucsi_acpi
typec_ucsi intel_rapl_common intel_lpss_pci intel_lpss intel_pch_thermal
intel_soc_dts_iosf typec int3403_thermal int340x_thermal_zone dell_smo8800
intel_hid int3400_thermal sparse_keymap acpi_thermal_rel acpi_pad
ipmi_msghandler i915 nouveau ttm i2c_algo_bit drm_kms_helper
[410260.351135]  rtsx_pci_sdmmc mmc_core drm mxm_wmi nvme crc32c_intel
nvme_core rtsx_pci serio_raw i2c_hid pinctrl_cannonlake video wmi pinctrl_i=
ntel
fuse [last unloaded: ip_tables]
[410260.351149] CPU: 4 PID: 199248 Comm: kworker/4:1 Tainted: P        W  O=
E=20=20=20
 5.3.0-1.fc31.x86_64 #1
[410260.351150] Hardware name: Dell Inc. Precision 5540/07C17G, BIOS 1.1.1
05/31/2019
[410260.351157] Workqueue: pm pm_runtime_work
[410260.351209] RIP: 0010:g84_bar_flush+0xcf/0xe0 [nouveau]
[410260.351213] Code: 8b 40 10 48 8b 78 10 4c 8b 6f 50 4d 85 ed 75 03 4c 8b=
 2f
e8 53 a6 0b eb 4c 89 ea 48 c7 c7 90 66 75 c0 48 89 c6 e8 af c0 b3 ea <0f> 0=
b eb
a7 e8 c8 bd b3 ea 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00
[410260.351215] RSP: 0018:ffffae3c90647640 EFLAGS: 00010086
[410260.351218] RAX: 0000000000000000 RBX: ffff88fe17fde800 RCX:
0000000000000006
[410260.351220] RDX: 0000000000000007 RSI: 0000000000000082 RDI:
ffff88fe1c317900
[410260.351222] RBP: ffff88fe17d6cec8 R08: 0000000000000001 R09:
0000000000006660
[410260.351223] R10: 000000000000fab4 R11: 0000000000000003 R12:
0000000000000246
[410260.351225] R13: ffff88fe17854350 R14: 0000000000000000 R15:
ffff88fe0c8851c0
[410260.351227] FS:  0000000000000000(0000) GS:ffff88fe1c300000(0000)
knlGS:0000000000000000
[410260.351229] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[410260.351230] CR2: 00007f0b974f9000 CR3: 000000027c40a006 CR4:
00000000003606e0
[410260.351232] Call Trace:
[410260.351312]  nv50_instobj_release+0x2f/0xc0 [nouveau]
[410260.351389]  nvkm_vmm_iter.constprop.0+0x2bc/0x810 [nouveau]
[410260.351397]  ? do_invalid_op+0x37/0x40
[410260.351475]  ? gp100_vmm_pgt_dma+0x200/0x200 [nouveau]
[410260.351563]  ? gp100_vmm_valid+0xf8/0x290 [nouveau]
[410260.351661]  nvkm_vmm_map+0x136/0x360 [nouveau]
[410260.351678]  ? gp100_vmm_pgt_dma+0x200/0x200 [nouveau]
[410260.351678]  nvkm_vram_map+0x56/0x80 [nouveau]
[410260.351678]  nvkm_uvmm_mthd+0x66a/0x780 [nouveau]
[410260.351678]  nvkm_ioctl+0xde/0x180 [nouveau]
[410260.351678]  nvif_object_mthd+0x104/0x130 [nouveau]
[410260.351678]  ? dma_fence_free+0x20/0x20
[410260.351678]  nvif_vmm_map+0x115/0x130 [nouveau]
[410260.351678]  ? reservation_object_wait_timeout_rcu+0x159/0x2d0
[410260.351678]  nouveau_mem_map+0x8d/0xf0 [nouveau]
[410260.351678]  nouveau_vma_map+0x44/0x70 [nouveau]
[410260.351678]  nouveau_bo_move_ntfy+0xc1/0xe0 [nouveau]
[410260.351678]  ttm_bo_handle_move_mem+0x3a1/0x4f0 [ttm]
[410260.351678]  ttm_bo_evict+0x150/0x1d0 [ttm]
[410260.351678]  ? find_busiest_group+0x40/0x540
[410260.351678]  ? drm_mm_scan_color_evict+0x66/0xd0 [drm]
[410260.351678]  ttm_mem_evict_first+0x262/0x340 [ttm]
[410260.351678]  ttm_bo_force_list_clean+0xa4/0x160 [ttm]
[410260.351678]  nouveau_do_suspend+0x80/0x170 [nouveau]
[410260.351678]  nouveau_pmops_runtime_suspend+0x40/0xa0 [nouveau]
[410260.351678]  pci_pm_runtime_suspend+0x58/0x140
[410260.351678]  ? __switch_to_asm+0x40/0x70
[410260.351678]  ? pci_pm_thaw_noirq+0xa0/0xa0
[410260.351678]  __rpm_callback+0xc1/0x140
[410260.351678]  ? pci_pm_thaw_noirq+0xa0/0xa0
[410260.351678]  rpm_callback+0x1f/0x70
[410260.351678]  rpm_suspend+0x10a/0x5a0
[410260.351678]  ? __switch_to_asm+0x34/0x70
[410260.351678]  pm_runtime_work+0x86/0x90
[410260.351678]  process_one_work+0x19d/0x340
[410260.351678]  worker_thread+0x50/0x3b0
[410260.351678]  kthread+0xfb/0x130
[410260.351678]  ? process_one_work+0x340/0x340
[410260.351678]  ? kthread_park+0x80/0x80
[410260.351678]  ret_from_fork+0x35/0x40
[410260.351678] ---[ end trace e039dd2359e6452b ]---
[410260.352898] nouveau 0000:01:00.0: tmr: stalled at ffffffffffffffff
[410260.352903] ------------[ cut here ]------------
[410260.352905] nouveau 0000:01:00.0: timeout
[410260.353068] WARNING: CPU: 4 PID: 199248 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c:44
tu102_vmm_flush+0x128/0x140 [nouveau]
[410260.353069] Modules linked in: uas usb_storage rc_cec
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_REJECT nf_reject_=
ipv6
ip6t_rpfilter ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_br=
oute
ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_=
nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 ebtable_filter ebtables ip6table_filter ip6_tables
iptable_filter ip_tables rfcomm snd_usb_audio snd_usbmidi_lib snd_rawmidi c=
cm
libcrc32c ip_set nfnetlink cmac bnep sunrpc vfat fat wacom hid_multitouch
dell_rbtn iTCO_wdt iTCO_vendor_support sof_pci_dev snd_sof_intel_hda_common
snd_sof_intel_hda snd_sof_intel_byt snd_sof_intel_ipc snd_sof
snd_sof_xtensa_dsp snd_soc_skl x86_pkg_temp_thermal intel_powerclamp
snd_soc_hdac_hda coretemp snd_hda_ext_core snd_soc_skl_ipc snd_soc_sst_ipc
kvm_intel snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_codec_hdmi
snd_soc_acpi dell_laptop kvm snd_soc_core mei_hdcp
[410260.353127]  snd_hda_codec_realtek mei_wdt dell_smm_hwmon
snd_hda_codec_generic intel_rapl_msr irqbypass ledtrig_audio snd_compress
ac97_bus snd_pcm_dmaengine snd_hda_intel crct10dif_pclmul crc32_pclmul
snd_hda_codec iwlmvm ghash_clmulni_intel snd_hda_core intel_cstate intel_un=
core
snd_hwdep intel_rapl_perf mac80211 joydev dell_wmi snd_seq dell_smbios dcdb=
as
snd_seq_device wmi_bmof intel_wmi_thunderbolt dell_wmi_descriptor snd_pcm
libarc4 uvcvideo btusb btrtl snd_timer btbcm i2c_i801 btintel videobuf2_vma=
lloc
videobuf2_memops iwlwifi snd videobuf2_v4l2 bluetooth videobuf2_common
rtsx_pci_ms cfg80211 soundcore videodev memstick thunderbolt mei_me
ecdh_generic rfkill idma64 mc mei ecc processor_thermal_device ucsi_acpi
typec_ucsi intel_rapl_common intel_lpss_pci intel_lpss intel_pch_thermal
intel_soc_dts_iosf typec int3403_thermal int340x_thermal_zone dell_smo8800
intel_hid int3400_thermal sparse_keymap acpi_thermal_rel acpi_pad
ipmi_msghandler i915 nouveau ttm i2c_algo_bit drm_kms_helper
[410260.353191]  rtsx_pci_sdmmc mmc_core drm mxm_wmi nvme crc32c_intel
nvme_core rtsx_pci serio_raw i2c_hid pinctrl_cannonlake video wmi pinctrl_i=
ntel
fuse [last unloaded: ip_tables]
[410260.353211] CPU: 4 PID: 199248 Comm: kworker/4:1 Tainted: P        W  O=
E=20=20=20
 5.3.0-1.fc31.x86_64 #1
[410260.353212] Hardware name: Dell Inc. Precision 5540/07C17G, BIOS 1.1.1
05/31/2019
[410260.353219] Workqueue: pm pm_runtime_work
[410260.353332] RIP: 0010:tu102_vmm_flush+0x128/0x140 [nouveau]
[410260.353337] Code: 8b 40 10 48 8b 78 10 4c 8b 67 50 4d 85 e4 75 03 4c 8b=
 27
e8 ca bd 06 eb 4c 89 e2 48 c7 c7 82 80 75 c0 48 89 c6 e8 26 d8 ae ea <0f> 0=
b eb
aa e8 3f d5 ae ea 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f
[410260.353340] RSP: 0018:ffffae3c90647678 EFLAGS: 00010286
[410260.353345] RAX: 0000000000000000 RBX: ffff88fe17fde800 RCX:
0000000000000006
[410260.353347] RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffff88fe1c317900
[410260.353349] RBP: ffff88fe0fb98820 R08: 0000000000000001 R09:
000000000000669f
[410260.353351] R10: 00000000000111c0 R11: 0000000000000003 R12:
ffff88fe17854350
[410260.353354] R13: ffff88fe0faab800 R14: 0000000000000000 R15:
ffff88fe0c8851c0
[410260.353358] FS:  0000000000000000(0000) GS:ffff88fe1c300000(0000)
knlGS:0000000000000000
[410260.353361] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[410260.353365] CR2: 00007f0b974f9000 CR3: 000000027c40a006 CR4:
00000000003606e0
[410260.353366] Call Trace:
[410260.353476]  nvkm_vmm_iter.constprop.0+0x34b/0x810 [nouveau]
[410260.353486]  ? do_invalid_op+0x37/0x40
[410260.353586]  ? gp100_vmm_pgt_dma+0x200/0x200 [nouveau]
[410260.353696]  ? gp100_vmm_valid+0xf8/0x290 [nouveau]
[410260.353704]  nvkm_vmm_map+0x136/0x360 [nouveau]
[410260.353704]  ? gp100_vmm_pgt_dma+0x200/0x200 [nouveau]
[410260.353704]  nvkm_vram_map+0x56/0x80 [nouveau]
[410260.353704]  nvkm_uvmm_mthd+0x66a/0x780 [nouveau]
[410260.353704]  nvkm_ioctl+0xde/0x180 [nouveau]
[410260.353704]  nvif_object_mthd+0x104/0x130 [nouveau]
[410260.353704]  ? dma_fence_free+0x20/0x20
[410260.353704]  nvif_vmm_map+0x115/0x130 [nouveau]
[410260.353704]  ? reservation_object_wait_timeout_rcu+0x159/0x2d0
[410260.353704]  nouveau_mem_map+0x8d/0xf0 [nouveau]
[410260.353704]  nouveau_vma_map+0x44/0x70 [nouveau]
[410260.353704]  nouveau_bo_move_ntfy+0xc1/0xe0 [nouveau]
[410260.353704]  ttm_bo_handle_move_mem+0x3a1/0x4f0 [ttm]
[410260.353704]  ttm_bo_evict+0x150/0x1d0 [ttm]
[410260.353704]  ? find_busiest_group+0x40/0x540
[410260.353704]  ? drm_mm_scan_color_evict+0x66/0xd0 [drm]
[410260.353704]  ttm_mem_evict_first+0x262/0x340 [ttm]
[410260.353704]  ttm_bo_force_list_clean+0xa4/0x160 [ttm]
[410260.353704]  nouveau_do_suspend+0x80/0x170 [nouveau]
[410260.353704]  nouveau_pmops_runtime_suspend+0x40/0xa0 [nouveau]
[410260.353704]  pci_pm_runtime_suspend+0x58/0x140
[410260.353704]  ? __switch_to_asm+0x40/0x70
[410260.353704]  ? pci_pm_thaw_noirq+0xa0/0xa0
[410260.353704]  __rpm_callback+0xc1/0x140
[410260.353704]  ? pci_pm_thaw_noirq+0xa0/0xa0
[410260.353704]  rpm_callback+0x1f/0x70
[410260.353704]  rpm_suspend+0x10a/0x5a0
[410260.353704]  ? __switch_to_asm+0x34/0x70
[410260.353704]  pm_runtime_work+0x86/0x90
[410260.353704]  process_one_work+0x19d/0x340
[410260.353704]  worker_thread+0x50/0x3b0
[410260.353704]  kthread+0xfb/0x130
[410260.353704]  ? process_one_work+0x340/0x340
[410260.353704]  ? kthread_park+0x80/0x80
[410260.353704]  ret_from_fork+0x35/0x40
[410260.353704] ---[ end trace e039dd2359e6452c ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15706399262.B7748CD.26115
Date: Wed, 9 Oct 2019 16:52:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - frequent timeout warnings during normal operation"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111940">111940</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>frequent timeout warnings during normal operation
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>neenaoffline&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145686=
" name=3D"attach_145686" title=3D"dmesg output">attachment 145686</a> <a hr=
ef=3D"attachment.cgi?id=3D145686&amp;action=3Dedit" title=3D"dmesg output">=
[details]</a></span>
dmesg output

I'm using a Dell 5540 which has an Nvidia Quadro T1000. I see frequent nouv=
eau
timeout warnings on dmesg. This shows up on gnome as a &quot;Something has =
gone
wrong&quot; pop up as well.

I am running Fedora 31 Beta. I have attached the output of lspci, lsmod and
dmesg. The relevant lines on dmesg look like:

[410260.350921] nouveau 0000:01:00.0: timeout
[410260.351057] WARNING: CPU: 4 PID: 199248 at
drivers/gpu/drm/nouveau/nvkm/subdev/bar/g84.c:35 g84_bar_flush+0xcf/0xe0
[nouveau]
[410260.351059] Modules linked in: uas usb_storage rc_cec
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_REJECT nf_reject_=
ipv6
ip6t_rpfilter ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_br=
oute
ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_=
nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 ebtable_filter ebtables ip6table_filter ip6_tables
iptable_filter ip_tables rfcomm snd_usb_audio snd_usbmidi_lib snd_rawmidi c=
cm
libcrc32c ip_set nfnetlink cmac bnep sunrpc vfat fat wacom hid_multitouch
dell_rbtn iTCO_wdt iTCO_vendor_support sof_pci_dev snd_sof_intel_hda_common
snd_sof_intel_hda snd_sof_intel_byt snd_sof_intel_ipc snd_sof
snd_sof_xtensa_dsp snd_soc_skl x86_pkg_temp_thermal intel_powerclamp
snd_soc_hdac_hda coretemp snd_hda_ext_core snd_soc_skl_ipc snd_soc_sst_ipc
kvm_intel snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_codec_hdmi
snd_soc_acpi dell_laptop kvm snd_soc_core mei_hdcp
[410260.351096]  snd_hda_codec_realtek mei_wdt dell_smm_hwmon
snd_hda_codec_generic intel_rapl_msr irqbypass ledtrig_audio snd_compress
ac97_bus snd_pcm_dmaengine snd_hda_intel crct10dif_pclmul crc32_pclmul
snd_hda_codec iwlmvm ghash_clmulni_intel snd_hda_core intel_cstate intel_un=
core
snd_hwdep intel_rapl_perf mac80211 joydev dell_wmi snd_seq dell_smbios dcdb=
as
snd_seq_device wmi_bmof intel_wmi_thunderbolt dell_wmi_descriptor snd_pcm
libarc4 uvcvideo btusb btrtl snd_timer btbcm i2c_i801 btintel videobuf2_vma=
lloc
videobuf2_memops iwlwifi snd videobuf2_v4l2 bluetooth videobuf2_common
rtsx_pci_ms cfg80211 soundcore videodev memstick thunderbolt mei_me
ecdh_generic rfkill idma64 mc mei ecc processor_thermal_device ucsi_acpi
typec_ucsi intel_rapl_common intel_lpss_pci intel_lpss intel_pch_thermal
intel_soc_dts_iosf typec int3403_thermal int340x_thermal_zone dell_smo8800
intel_hid int3400_thermal sparse_keymap acpi_thermal_rel acpi_pad
ipmi_msghandler i915 nouveau ttm i2c_algo_bit drm_kms_helper
[410260.351135]  rtsx_pci_sdmmc mmc_core drm mxm_wmi nvme crc32c_intel
nvme_core rtsx_pci serio_raw i2c_hid pinctrl_cannonlake video wmi pinctrl_i=
ntel
fuse [last unloaded: ip_tables]
[410260.351149] CPU: 4 PID: 199248 Comm: kworker/4:1 Tainted: P        W  O=
E=20=20=20
 5.3.0-1.fc31.x86_64 #1
[410260.351150] Hardware name: Dell Inc. Precision 5540/07C17G, BIOS 1.1.1
05/31/2019
[410260.351157] Workqueue: pm pm_runtime_work
[410260.351209] RIP: 0010:g84_bar_flush+0xcf/0xe0 [nouveau]
[410260.351213] Code: 8b 40 10 48 8b 78 10 4c 8b 6f 50 4d 85 ed 75 03 4c 8b=
 2f
e8 53 a6 0b eb 4c 89 ea 48 c7 c7 90 66 75 c0 48 89 c6 e8 af c0 b3 ea &lt;0f=
&gt; 0b eb
a7 e8 c8 bd b3 ea 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00
[410260.351215] RSP: 0018:ffffae3c90647640 EFLAGS: 00010086
[410260.351218] RAX: 0000000000000000 RBX: ffff88fe17fde800 RCX:
0000000000000006
[410260.351220] RDX: 0000000000000007 RSI: 0000000000000082 RDI:
ffff88fe1c317900
[410260.351222] RBP: ffff88fe17d6cec8 R08: 0000000000000001 R09:
0000000000006660
[410260.351223] R10: 000000000000fab4 R11: 0000000000000003 R12:
0000000000000246
[410260.351225] R13: ffff88fe17854350 R14: 0000000000000000 R15:
ffff88fe0c8851c0
[410260.351227] FS:  0000000000000000(0000) GS:ffff88fe1c300000(0000)
knlGS:0000000000000000
[410260.351229] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[410260.351230] CR2: 00007f0b974f9000 CR3: 000000027c40a006 CR4:
00000000003606e0
[410260.351232] Call Trace:
[410260.351312]  nv50_instobj_release+0x2f/0xc0 [nouveau]
[410260.351389]  nvkm_vmm_iter.constprop.0+0x2bc/0x810 [nouveau]
[410260.351397]  ? do_invalid_op+0x37/0x40
[410260.351475]  ? gp100_vmm_pgt_dma+0x200/0x200 [nouveau]
[410260.351563]  ? gp100_vmm_valid+0xf8/0x290 [nouveau]
[410260.351661]  nvkm_vmm_map+0x136/0x360 [nouveau]
[410260.351678]  ? gp100_vmm_pgt_dma+0x200/0x200 [nouveau]
[410260.351678]  nvkm_vram_map+0x56/0x80 [nouveau]
[410260.351678]  nvkm_uvmm_mthd+0x66a/0x780 [nouveau]
[410260.351678]  nvkm_ioctl+0xde/0x180 [nouveau]
[410260.351678]  nvif_object_mthd+0x104/0x130 [nouveau]
[410260.351678]  ? dma_fence_free+0x20/0x20
[410260.351678]  nvif_vmm_map+0x115/0x130 [nouveau]
[410260.351678]  ? reservation_object_wait_timeout_rcu+0x159/0x2d0
[410260.351678]  nouveau_mem_map+0x8d/0xf0 [nouveau]
[410260.351678]  nouveau_vma_map+0x44/0x70 [nouveau]
[410260.351678]  nouveau_bo_move_ntfy+0xc1/0xe0 [nouveau]
[410260.351678]  ttm_bo_handle_move_mem+0x3a1/0x4f0 [ttm]
[410260.351678]  ttm_bo_evict+0x150/0x1d0 [ttm]
[410260.351678]  ? find_busiest_group+0x40/0x540
[410260.351678]  ? drm_mm_scan_color_evict+0x66/0xd0 [drm]
[410260.351678]  ttm_mem_evict_first+0x262/0x340 [ttm]
[410260.351678]  ttm_bo_force_list_clean+0xa4/0x160 [ttm]
[410260.351678]  nouveau_do_suspend+0x80/0x170 [nouveau]
[410260.351678]  nouveau_pmops_runtime_suspend+0x40/0xa0 [nouveau]
[410260.351678]  pci_pm_runtime_suspend+0x58/0x140
[410260.351678]  ? __switch_to_asm+0x40/0x70
[410260.351678]  ? pci_pm_thaw_noirq+0xa0/0xa0
[410260.351678]  __rpm_callback+0xc1/0x140
[410260.351678]  ? pci_pm_thaw_noirq+0xa0/0xa0
[410260.351678]  rpm_callback+0x1f/0x70
[410260.351678]  rpm_suspend+0x10a/0x5a0
[410260.351678]  ? __switch_to_asm+0x34/0x70
[410260.351678]  pm_runtime_work+0x86/0x90
[410260.351678]  process_one_work+0x19d/0x340
[410260.351678]  worker_thread+0x50/0x3b0
[410260.351678]  kthread+0xfb/0x130
[410260.351678]  ? process_one_work+0x340/0x340
[410260.351678]  ? kthread_park+0x80/0x80
[410260.351678]  ret_from_fork+0x35/0x40
[410260.351678] ---[ end trace e039dd2359e6452b ]---
[410260.352898] nouveau 0000:01:00.0: tmr: stalled at ffffffffffffffff
[410260.352903] ------------[ cut here ]------------
[410260.352905] nouveau 0000:01:00.0: timeout
[410260.353068] WARNING: CPU: 4 PID: 199248 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c:44
tu102_vmm_flush+0x128/0x140 [nouveau]
[410260.353069] Modules linked in: uas usb_storage rc_cec
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_REJECT nf_reject_=
ipv6
ip6t_rpfilter ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_br=
oute
ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_=
nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 ebtable_filter ebtables ip6table_filter ip6_tables
iptable_filter ip_tables rfcomm snd_usb_audio snd_usbmidi_lib snd_rawmidi c=
cm
libcrc32c ip_set nfnetlink cmac bnep sunrpc vfat fat wacom hid_multitouch
dell_rbtn iTCO_wdt iTCO_vendor_support sof_pci_dev snd_sof_intel_hda_common
snd_sof_intel_hda snd_sof_intel_byt snd_sof_intel_ipc snd_sof
snd_sof_xtensa_dsp snd_soc_skl x86_pkg_temp_thermal intel_powerclamp
snd_soc_hdac_hda coretemp snd_hda_ext_core snd_soc_skl_ipc snd_soc_sst_ipc
kvm_intel snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_codec_hdmi
snd_soc_acpi dell_laptop kvm snd_soc_core mei_hdcp
[410260.353127]  snd_hda_codec_realtek mei_wdt dell_smm_hwmon
snd_hda_codec_generic intel_rapl_msr irqbypass ledtrig_audio snd_compress
ac97_bus snd_pcm_dmaengine snd_hda_intel crct10dif_pclmul crc32_pclmul
snd_hda_codec iwlmvm ghash_clmulni_intel snd_hda_core intel_cstate intel_un=
core
snd_hwdep intel_rapl_perf mac80211 joydev dell_wmi snd_seq dell_smbios dcdb=
as
snd_seq_device wmi_bmof intel_wmi_thunderbolt dell_wmi_descriptor snd_pcm
libarc4 uvcvideo btusb btrtl snd_timer btbcm i2c_i801 btintel videobuf2_vma=
lloc
videobuf2_memops iwlwifi snd videobuf2_v4l2 bluetooth videobuf2_common
rtsx_pci_ms cfg80211 soundcore videodev memstick thunderbolt mei_me
ecdh_generic rfkill idma64 mc mei ecc processor_thermal_device ucsi_acpi
typec_ucsi intel_rapl_common intel_lpss_pci intel_lpss intel_pch_thermal
intel_soc_dts_iosf typec int3403_thermal int340x_thermal_zone dell_smo8800
intel_hid int3400_thermal sparse_keymap acpi_thermal_rel acpi_pad
ipmi_msghandler i915 nouveau ttm i2c_algo_bit drm_kms_helper
[410260.353191]  rtsx_pci_sdmmc mmc_core drm mxm_wmi nvme crc32c_intel
nvme_core rtsx_pci serio_raw i2c_hid pinctrl_cannonlake video wmi pinctrl_i=
ntel
fuse [last unloaded: ip_tables]
[410260.353211] CPU: 4 PID: 199248 Comm: kworker/4:1 Tainted: P        W  O=
E=20=20=20
 5.3.0-1.fc31.x86_64 #1
[410260.353212] Hardware name: Dell Inc. Precision 5540/07C17G, BIOS 1.1.1
05/31/2019
[410260.353219] Workqueue: pm pm_runtime_work
[410260.353332] RIP: 0010:tu102_vmm_flush+0x128/0x140 [nouveau]
[410260.353337] Code: 8b 40 10 48 8b 78 10 4c 8b 67 50 4d 85 e4 75 03 4c 8b=
 27
e8 ca bd 06 eb 4c 89 e2 48 c7 c7 82 80 75 c0 48 89 c6 e8 26 d8 ae ea &lt;0f=
&gt; 0b eb
aa e8 3f d5 ae ea 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f
[410260.353340] RSP: 0018:ffffae3c90647678 EFLAGS: 00010286
[410260.353345] RAX: 0000000000000000 RBX: ffff88fe17fde800 RCX:
0000000000000006
[410260.353347] RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffff88fe1c317900
[410260.353349] RBP: ffff88fe0fb98820 R08: 0000000000000001 R09:
000000000000669f
[410260.353351] R10: 00000000000111c0 R11: 0000000000000003 R12:
ffff88fe17854350
[410260.353354] R13: ffff88fe0faab800 R14: 0000000000000000 R15:
ffff88fe0c8851c0
[410260.353358] FS:  0000000000000000(0000) GS:ffff88fe1c300000(0000)
knlGS:0000000000000000
[410260.353361] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[410260.353365] CR2: 00007f0b974f9000 CR3: 000000027c40a006 CR4:
00000000003606e0
[410260.353366] Call Trace:
[410260.353476]  nvkm_vmm_iter.constprop.0+0x34b/0x810 [nouveau]
[410260.353486]  ? do_invalid_op+0x37/0x40
[410260.353586]  ? gp100_vmm_pgt_dma+0x200/0x200 [nouveau]
[410260.353696]  ? gp100_vmm_valid+0xf8/0x290 [nouveau]
[410260.353704]  nvkm_vmm_map+0x136/0x360 [nouveau]
[410260.353704]  ? gp100_vmm_pgt_dma+0x200/0x200 [nouveau]
[410260.353704]  nvkm_vram_map+0x56/0x80 [nouveau]
[410260.353704]  nvkm_uvmm_mthd+0x66a/0x780 [nouveau]
[410260.353704]  nvkm_ioctl+0xde/0x180 [nouveau]
[410260.353704]  nvif_object_mthd+0x104/0x130 [nouveau]
[410260.353704]  ? dma_fence_free+0x20/0x20
[410260.353704]  nvif_vmm_map+0x115/0x130 [nouveau]
[410260.353704]  ? reservation_object_wait_timeout_rcu+0x159/0x2d0
[410260.353704]  nouveau_mem_map+0x8d/0xf0 [nouveau]
[410260.353704]  nouveau_vma_map+0x44/0x70 [nouveau]
[410260.353704]  nouveau_bo_move_ntfy+0xc1/0xe0 [nouveau]
[410260.353704]  ttm_bo_handle_move_mem+0x3a1/0x4f0 [ttm]
[410260.353704]  ttm_bo_evict+0x150/0x1d0 [ttm]
[410260.353704]  ? find_busiest_group+0x40/0x540
[410260.353704]  ? drm_mm_scan_color_evict+0x66/0xd0 [drm]
[410260.353704]  ttm_mem_evict_first+0x262/0x340 [ttm]
[410260.353704]  ttm_bo_force_list_clean+0xa4/0x160 [ttm]
[410260.353704]  nouveau_do_suspend+0x80/0x170 [nouveau]
[410260.353704]  nouveau_pmops_runtime_suspend+0x40/0xa0 [nouveau]
[410260.353704]  pci_pm_runtime_suspend+0x58/0x140
[410260.353704]  ? __switch_to_asm+0x40/0x70
[410260.353704]  ? pci_pm_thaw_noirq+0xa0/0xa0
[410260.353704]  __rpm_callback+0xc1/0x140
[410260.353704]  ? pci_pm_thaw_noirq+0xa0/0xa0
[410260.353704]  rpm_callback+0x1f/0x70
[410260.353704]  rpm_suspend+0x10a/0x5a0
[410260.353704]  ? __switch_to_asm+0x34/0x70
[410260.353704]  pm_runtime_work+0x86/0x90
[410260.353704]  process_one_work+0x19d/0x340
[410260.353704]  worker_thread+0x50/0x3b0
[410260.353704]  kthread+0xfb/0x130
[410260.353704]  ? process_one_work+0x340/0x340
[410260.353704]  ? kthread_park+0x80/0x80
[410260.353704]  ret_from_fork+0x35/0x40
[410260.353704] ---[ end trace e039dd2359e6452c ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15706399262.B7748CD.26115--

--===============0957025489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0957025489==--
