Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8510F59AA34
	for <lists+nouveau@lfdr.de>; Sat, 20 Aug 2022 02:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0083610E097;
	Sat, 20 Aug 2022 00:40:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260FB10E1B4
 for <nouveau@lists.freedesktop.org>; Sat, 20 Aug 2022 00:40:36 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gcfxn-nouveau@m.gmane-mx.org>) id 1oPCXS-0003IM-8M
 for nouveau@lists.freedesktop.org; Sat, 20 Aug 2022 02:40:34 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: nouveau@lists.freedesktop.org
From: Timothy Madden <terminatorul@gmail.com>
Date: Sat, 20 Aug 2022 03:40:28 +0300
Message-ID: <tdpahs$bqd$1@ciao.gmane.io>
References: <tdo9up$t3e$1@ciao.gmane.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
In-Reply-To: <tdo9up$t3e$1@ciao.gmane.io>
Subject: Re: [Nouveau] Quadro GPU shows as UNCLAIMED
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 8/19/22 18:24, Timothy Madden wrote:
> Hello
> 
> I have a Quadro T2000 Mobile that shows up as TU117GLM in lspci and as 
> UNCLAIMED in lshw.
> 
> I can get display output, but for the primary display only (laptop LVDS 
> display).
> 
> Is this expected, is this card unsupported please ? Is there something I 
> can do ?
> 
> I have nothing about nouveau or NVIDIA in my dmesg output, except for 
> audio HDA NVIDIA. Xorg log shows it is loading nouveau, but says "Failed 
> to open drm device". nouveau lists no support for NV160 / TUxxx chips in 
> Xorg startup log file (nothing above GPxxx).
> 
> nouveau shows up in the output of lsmod, with a count of 0.
> 
> Thank you,
> Timothy Madden
> 
> 
> Fedora release 36, kernel 5.18.17
> xorg-x11-drv-nouveau 1.0.17 (3.fc36), Mesa 22.1.6
> 
> [timothy@fedora ~]$ lspci | grep VGA
> 01:00.0 VGA compatible controller: NVIDIA Corporation TU117GLM [Quadro 
> T2000 Mobile / Max-Q] (rev a1)
> 

Turns out I had nomodeset parameter on the kernel command line (in 
GRUB), because I installed Fedora 36 using "basic" graphics mode. Normal 
mode resulted in a blank screen for me during Fedora instalation.

Then I had a problem with nouveau showing a stack trace in dmesg, 
because I connected an HDMI monitor (DELL U2722D) using an USB-C to HDMI 
adapter (see bellow). This has triggered crash notifications on my 
desktop and is reproducible. Probably the reason Fedora installer 
required "basic" graphics mode.

Thank you,
Timothy Madden

[ 2112.965628] ------------[ cut here ]------------
[ 2112.965630] WARNING: CPU: 12 PID: 2792 at 
drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:465 
nvkm_dp_acquire+0x235/0x460 [nouveau]
[ 2112.965680] Modules linked in: tls rfcomm snd_seq_dummy snd_hrtimer 
nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet 
nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 
nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack 
nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink qrtr bnep 
sunrpc vfat fat snd_sof_pci_intel_cnl snd_sof_intel_hda_common 
soundwire_intel soundwire_generic_allocation soundwire_cadence 
snd_sof_intel_hda snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils 
soundwire_bus snd_soc_skl snd_soc_hdac_hda snd_hda_ext_core 
snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_soc_acpi 
intel_tcc_cooling snd_soc_core x86_pkg_temp_thermal intel_powerclamp 
coretemp snd_compress iwlmvm snd_ctl_led kvm_intel ac97_bus 
snd_hda_codec_realtek snd_pcm_dmaengine iTCO_wdt snd_hda_codec_generic 
snd_hda_codec_hdmi ee1004 intel_pmc_bxt kvm mei_pxp mei_hdcp mei_wdt 
snd_hda_intel iTCO_vendor_support mac80211 snd_intel_dspcfg
[ 2112.965701]  intel_rapl_msr dell_laptop snd_intel_sdw_acpi irqbypass 
libarc4 dell_smm_hwmon btusb snd_hda_codec rapl intel_cstate btrtl 
snd_usb_audio uvcvideo dell_wmi intel_uncore iwlwifi btbcm ledtrig_audio 
pcspkr snd_hda_core videobuf2_vmalloc snd_usbmidi_lib btintel 
dell_smbios dell_wmi_sysman videobuf2_memops dcdbas iwlmei 
videobuf2_v4l2 snd_rawmidi firmware_attributes_class snd_hwdep btmtk 
dell_wmi_descriptor wmi_bmof i2c_i801 snd_seq videobuf2_common 
intel_wmi_thunderbolt snd_seq_device bluetooth i2c_smbus thunderbolt 
cfg80211 videodev snd_pcm mei_me joydev snd_timer mc 
processor_thermal_device_pci_legacy mei processor_thermal_device snd 
processor_thermal_rfim ecdh_generic processor_thermal_mbox rfkill 
processor_thermal_rapl idma64 intel_rapl_common soundcore 
intel_soc_dts_iosf intel_pch_thermal int3403_thermal intel_hid 
int3400_thermal int340x_thermal_zone sparse_keymap acpi_thermal_rel 
acpi_pad zram dm_crypt hid_plantronics hid_sensor_hub intel_ishtp_hid 
nouveau rtsx_pci_sdmmc
[ 2112.965723]  mmc_core drm_ttm_helper ttm intel_ish_ipc hid_multitouch 
ucsi_acpi crct10dif_pclmul nvme crc32_pclmul mxm_wmi crc32c_intel e1000e 
ghash_clmulni_intel nvme_core rtsx_pci typec_ucsi serio_raw 
drm_dp_helper intel_ishtp typec i2c_hid_acpi i2c_hid wmi video 
pinctrl_cannonlake fuse
[ 2112.965731] CPU: 12 PID: 2792 Comm: kworker/u32:19 Not tainted 
5.18.17-200.fc36.x86_64 #1
[ 2112.965733] Hardware name: Dell Inc. Precision 7550/01CFGW, BIOS 
1.17.0 07/11/2022
[ 2112.965734] Workqueue: nvkm-disp gv100_disp_super [nouveau]
[ 2112.965773] RIP: 0010:nvkm_dp_acquire+0x235/0x460 [nouveau]
[ 2112.965810] Code: c7 83 88 01 00 00 01 00 00 00 48 8b 7c 24 08 e8 71 
3e 58 cc 44 89 e0 48 83 c4 50 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc 
cc <0f> 0b c1 e8 03 41 88 6d 5a 44 89 fe 48 89 df 48 69 c0 cf 0d d6 26
[ 2112.965811] RSP: 0018:ffffb82601697d68 EFLAGS: 00010246
[ 2112.965812] RAX: 0000000000083d60 RBX: ffffa045093cf400 RCX: 
0000000000107ac0
[ 2112.965813] RDX: ffffffffc0787450 RSI: 0000000000000000 RDI: 
ffffb82601697d00
[ 2112.965814] RBP: 0000000000000002 R08: ffffa04501000b40 R09: 
0000000000005fc4
[ 2112.965814] R10: 0000000000000005 R11: ffffb82601697de8 R12: 
00000000ffffffea
[ 2112.965815] R13: ffffa045131ade40 R14: 0000000000114f27 R15: 
0000000000000000
[ 2112.965816] FS:  0000000000000000(0000) GS:ffffa0544bd00000(0000) 
knlGS:0000000000000000
[ 2112.965816] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2112.965817] CR2: 000055d3fe80e000 CR3: 000000089be10001 CR4: 
00000000007706e0
[ 2112.965818] PKRU: 55555554
[ 2112.965818] Call Trace:
[ 2112.965820]  <TASK>
[ 2112.965821]  nv50_disp_super_2_2+0x6d/0x430 [nouveau]
[ 2112.965858]  gv100_disp_super+0x1ce/0x250 [nouveau]
[ 2112.965894]  process_one_work+0x1c4/0x380
[ 2112.965897]  worker_thread+0x4d/0x380
[ 2112.965898]  ? _raw_spin_lock_irqsave+0x23/0x50
[ 2112.965900]  ? process_one_work+0x380/0x380
[ 2112.965901]  kthread+0xe6/0x110
[ 2112.965903]  ? kthread_complete_and_exit+0x20/0x20
[ 2112.965904]  ret_from_fork+0x1f/0x30
[ 2112.965907]  </TASK>
[ 2112.965907] ---[ end trace 0000000000000000 ]---
[ 2113.145812] nouveau 0000:01:00.0: disp: error 00100000


