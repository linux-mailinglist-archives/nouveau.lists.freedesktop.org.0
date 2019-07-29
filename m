Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD6279C83
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2019 00:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D658089BF8;
	Mon, 29 Jul 2019 22:44:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5DBC089BF8
 for <nouveau@lists.freedesktop.org>; Mon, 29 Jul 2019 22:44:40 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 53AED72167; Mon, 29 Jul 2019 22:44:40 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 29 Jul 2019 22:44:40 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: liewkj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111213-8800-tJAZjZ4E05@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111213-8800@http.bugs.freedesktop.org/>
References: <bug-111213-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111213] VA-API nouveau SIGSEGV and asserts
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
Content-Type: multipart/mixed; boundary="===============0167615120=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0167615120==
Content-Type: multipart/alternative; boundary="15644402800.E5F53bfB4.32192"
Content-Transfer-Encoding: 7bit


--15644402800.E5F53bfB4.32192
Date: Mon, 29 Jul 2019 22:44:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111213

--- Comment #11 from KJ Liew <liewkj@yahoo.com> ---
$ LIBVA_DRIVER_NAME=3Dnouveau chromium
nve4_set_surface_info:969 - unsupported surface format, try
is_format_supported() !
nve4_set_surface_info:969 - unsupported surface format, try
is_format_supported() !
nve4_set_surface_info:969 - unsupported surface format, try
is_format_supported() !
nve4_set_surface_info:969 - unsupported surface format, try
is_format_supported() !
nve4_set_surface_info:969 - unsupported surface format, try
is_format_supported() !

$ LIBVA_DRIVER_NAME=3Dvdpau VDPAU_DRIVER=3Dnouveau chromium

[  550.938006] chromium[1880]: segfault at 1ad ip 00007fef0d3c9afb sp
00007ffc0e96a530 error 4 in libvdpau_nouveau.so.1.0.0[7fef0d0ad000+4ea000]
[  550.938013] Code: 55 41 54 55 48 89 fd 53 48 83 ec 08 4c 8b a7 e8 04 00 =
00
48 8b 9f 20 05 00 00 4c 8b af c0 03 00 00 41 0f b6 44 24 02 c0 e8 07 <38> 8=
3 ad
01 00 00 74 25 48 83 bb f0 01 00 00 00 74 15 48 8d bb f0
[  551.612811] ------------[ cut here ]------------
[  551.612912] WARNING: CPU: 3 PID: 168 at
drivers/gpu/drm/nouveau/nvif/vmm.c:68 nvif_vmm_put.cold+0xc/0x13 [nouveau]
[  551.612912] Modules linked in: fuse rfcomm cmac bnep nls_iso8859_1 nls_c=
p437
vfat fat hid_logitech_hidpp mousedev joydev input_leds snd_hda_codec_hdmi
bridge stp llc nouveau edac_mce_amd kvm_amd hid_logitech_dj ccp rng_core kvm
irqbypass btusb mxm_wmi snd_hda_codec_realtek btrtl wmi btbcm btintel
i2c_algo_bit ttm snd_hda_codec_generic bluetooth ledtrig_audio drm_kms_help=
er
hid_generic snd_hda_intel drm crct10dif_pclmul snd_hda_codec crc32_pclmul
ecdh_generic snd_hda_core usbhid rfkill ghash_clmulni_intel snd_hwdep ecc
snd_pcm agpgart hid syscopyarea r8169 sysfillrect aesni_intel snd_timer
sysimgblt realtek sp5100_tco fb_sys_fops aes_x86_64 snd crypto_simd cryptd
fam15h_power k10temp pcspkr libphy glue_helper soundcore i2c_piix4 evdev
pcc_cpufreq mac_hid acpi_cpufreq crypto_user ip_tables x_tables ext4
crc32c_generic crc16 mbcache jbd2 ohci_pci sd_mod ahci libahci libata xhci_=
pci
crc32c_intel ehci_pci scsi_mod xhci_hcd ehci_hcd ohci_hcd
[  551.612945] CPU: 3 PID: 168 Comm: kworker/3:1 Not tainted 5.2.3-arch1-1-=
ARCH
#1
[  551.612946] Hardware name: Gigabyte Technology Co., Ltd. To be filled by
O.E.M./970A-DS3P, BIOS FD 02/26/2016
[  551.612986] Workqueue: events nouveau_cli_work [nouveau]
[  551.613026] RIP: 0010:nvif_vmm_put.cold+0xc/0x13 [nouveau]
[  551.613028] Code: 45 31 e4 e9 65 1d f1 ff 48 c7 c7 98 1a c6 c0 e8 f3 04 =
d6
d3 0f 0b 45 31 e4 e9 4f 1d f1 ff 48 c7 c7 e8 1a c6 c0 e8 dd 04 d6 d3 <0f> 0=
b e9
dc 21 f1 ff 48 c7 c7 e8 1a c6 c0 e8 ca 04 d6 d3 0f 0b b8
[  551.613029] RSP: 0018:ffffb14c41d1bdc8 EFLAGS: 00010246
[  551.613030] RAX: 0000000000000024 RBX: ffffb14c41d1bdf0 RCX:
0000000000000000
[  551.613031] RDX: 0000000000000000 RSI: ffff9ea8dead76e8 RDI:
00000000ffffffff
[  551.613032] RBP: ffffb14c41d1be20 R08: 00000000000003b2 R09:
0000000000000001
[  551.613032] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff9ea8c18e3780
[  551.613033] R13: dead000000000200 R14: dead000000000100 R15:
ffff9ea8d8ad76a8
[  551.613034] FS:  0000000000000000(0000) GS:ffff9ea8deac0000(0000)
knlGS:0000000000000000
[  551.613035] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  551.613035] CR2: 00007f3038178000 CR3: 00000003ef73e000 CR4:
00000000000406e0
[  551.613036] Call Trace:
[  551.613080]  nouveau_vma_del+0x81/0xc0 [nouveau]
[  551.613121]  nouveau_gem_object_delete_work+0x36/0x60 [nouveau]
[  551.613161]  nouveau_cli_work+0xbd/0x100 [nouveau]
[  551.613165]  process_one_work+0x1d1/0x3e0
[  551.613167]  worker_thread+0x4a/0x3d0
[  551.613170]  kthread+0xfb/0x130
[  551.613171]  ? process_one_work+0x3e0/0x3e0
[  551.613172]  ? kthread_park+0x80/0x80
[  551.613175]  ret_from_fork+0x22/0x40
[  551.613177] ---[ end trace eae1db9979ded55f ]---

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15644402800.E5F53bfB4.32192
Date: Mon, 29 Jul 2019 22:44:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213">bug 11121=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
liewkj&#64;yahoo.com" title=3D"KJ Liew &lt;liewkj&#64;yahoo.com&gt;"> <span=
 class=3D"fn">KJ Liew</span></a>
</span></b>
        <pre>$ LIBVA_DRIVER_NAME=3Dnouveau chromium
nve4_set_surface_info:969 - unsupported surface format, try
is_format_supported() !
nve4_set_surface_info:969 - unsupported surface format, try
is_format_supported() !
nve4_set_surface_info:969 - unsupported surface format, try
is_format_supported() !
nve4_set_surface_info:969 - unsupported surface format, try
is_format_supported() !
nve4_set_surface_info:969 - unsupported surface format, try
is_format_supported() !

$ LIBVA_DRIVER_NAME=3Dvdpau VDPAU_DRIVER=3Dnouveau chromium

[  550.938006] chromium[1880]: segfault at 1ad ip 00007fef0d3c9afb sp
00007ffc0e96a530 error 4 in libvdpau_nouveau.so.1.0.0[7fef0d0ad000+4ea000]
[  550.938013] Code: 55 41 54 55 48 89 fd 53 48 83 ec 08 4c 8b a7 e8 04 00 =
00
48 8b 9f 20 05 00 00 4c 8b af c0 03 00 00 41 0f b6 44 24 02 c0 e8 07 &lt;38=
&gt; 83 ad
01 00 00 74 25 48 83 bb f0 01 00 00 00 74 15 48 8d bb f0
[  551.612811] ------------[ cut here ]------------
[  551.612912] WARNING: CPU: 3 PID: 168 at
drivers/gpu/drm/nouveau/nvif/vmm.c:68 nvif_vmm_put.cold+0xc/0x13 [nouveau]
[  551.612912] Modules linked in: fuse rfcomm cmac bnep nls_iso8859_1 nls_c=
p437
vfat fat hid_logitech_hidpp mousedev joydev input_leds snd_hda_codec_hdmi
bridge stp llc nouveau edac_mce_amd kvm_amd hid_logitech_dj ccp rng_core kvm
irqbypass btusb mxm_wmi snd_hda_codec_realtek btrtl wmi btbcm btintel
i2c_algo_bit ttm snd_hda_codec_generic bluetooth ledtrig_audio drm_kms_help=
er
hid_generic snd_hda_intel drm crct10dif_pclmul snd_hda_codec crc32_pclmul
ecdh_generic snd_hda_core usbhid rfkill ghash_clmulni_intel snd_hwdep ecc
snd_pcm agpgart hid syscopyarea r8169 sysfillrect aesni_intel snd_timer
sysimgblt realtek sp5100_tco fb_sys_fops aes_x86_64 snd crypto_simd cryptd
fam15h_power k10temp pcspkr libphy glue_helper soundcore i2c_piix4 evdev
pcc_cpufreq mac_hid acpi_cpufreq crypto_user ip_tables x_tables ext4
crc32c_generic crc16 mbcache jbd2 ohci_pci sd_mod ahci libahci libata xhci_=
pci
crc32c_intel ehci_pci scsi_mod xhci_hcd ehci_hcd ohci_hcd
[  551.612945] CPU: 3 PID: 168 Comm: kworker/3:1 Not tainted 5.2.3-arch1-1-=
ARCH
#1
[  551.612946] Hardware name: Gigabyte Technology Co., Ltd. To be filled by
O.E.M./970A-DS3P, BIOS FD 02/26/2016
[  551.612986] Workqueue: events nouveau_cli_work [nouveau]
[  551.613026] RIP: 0010:nvif_vmm_put.cold+0xc/0x13 [nouveau]
[  551.613028] Code: 45 31 e4 e9 65 1d f1 ff 48 c7 c7 98 1a c6 c0 e8 f3 04 =
d6
d3 0f 0b 45 31 e4 e9 4f 1d f1 ff 48 c7 c7 e8 1a c6 c0 e8 dd 04 d6 d3 &lt;0f=
&gt; 0b e9
dc 21 f1 ff 48 c7 c7 e8 1a c6 c0 e8 ca 04 d6 d3 0f 0b b8
[  551.613029] RSP: 0018:ffffb14c41d1bdc8 EFLAGS: 00010246
[  551.613030] RAX: 0000000000000024 RBX: ffffb14c41d1bdf0 RCX:
0000000000000000
[  551.613031] RDX: 0000000000000000 RSI: ffff9ea8dead76e8 RDI:
00000000ffffffff
[  551.613032] RBP: ffffb14c41d1be20 R08: 00000000000003b2 R09:
0000000000000001
[  551.613032] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff9ea8c18e3780
[  551.613033] R13: dead000000000200 R14: dead000000000100 R15:
ffff9ea8d8ad76a8
[  551.613034] FS:  0000000000000000(0000) GS:ffff9ea8deac0000(0000)
knlGS:0000000000000000
[  551.613035] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  551.613035] CR2: 00007f3038178000 CR3: 00000003ef73e000 CR4:
00000000000406e0
[  551.613036] Call Trace:
[  551.613080]  nouveau_vma_del+0x81/0xc0 [nouveau]
[  551.613121]  nouveau_gem_object_delete_work+0x36/0x60 [nouveau]
[  551.613161]  nouveau_cli_work+0xbd/0x100 [nouveau]
[  551.613165]  process_one_work+0x1d1/0x3e0
[  551.613167]  worker_thread+0x4a/0x3d0
[  551.613170]  kthread+0xfb/0x130
[  551.613171]  ? process_one_work+0x3e0/0x3e0
[  551.613172]  ? kthread_park+0x80/0x80
[  551.613175]  ret_from_fork+0x22/0x40
[  551.613177] ---[ end trace eae1db9979ded55f ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15644402800.E5F53bfB4.32192--

--===============0167615120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0167615120==--
