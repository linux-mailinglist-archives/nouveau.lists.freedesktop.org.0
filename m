Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F2963F72
	for <lists+nouveau@lfdr.de>; Wed, 10 Jul 2019 04:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912A9899A5;
	Wed, 10 Jul 2019 02:53:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1FF67899A5
 for <nouveau@lists.freedesktop.org>; Wed, 10 Jul 2019 02:53:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1CFAD72167; Wed, 10 Jul 2019 02:53:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 10 Jul 2019 02:53:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jhnmlkvch9@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: qa_contact assigned_to component
Message-ID: <bug-111044-8800-7LJsFq7pvY@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111044-8800@http.bugs.freedesktop.org/>
References: <bug-111044-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111044] Resume up from suspend sometimes freezes
 system (Optimus/Nouveau)
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
Content-Type: multipart/mixed; boundary="===============2115574994=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============2115574994==
Content-Type: multipart/alternative; boundary="15627272361.2F08B6CeE.32033"
Content-Transfer-Encoding: 7bit


--15627272361.2F08B6CeE.32033
Date: Wed, 10 Jul 2019 02:53:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111044

JM9 <jhnmlkvch9@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         QA Contact|intel-gfx-bugs@lists.freede |xorg-team@lists.x.org
                   |sktop.org                   |
           Assignee|chris@chris-wilson.co.uk    |nouveau@lists.freedesktop.o
                   |                            |rg
          Component|Driver/intel                |Driver/nouveau

--- Comment #13 from JM9 <jhnmlkvch9@gmail.com> ---
So I ran into this again and on the way back, stopped off at office to
reconnect monitors to see if  it will wake up. Unfortunately, that didn't w=
ork.
But I was able to get this from the journal. Hope it is of some help:

LID opened
ACPI action undefined: PNP0C0A:00
kernel: WARNING: CPU: 0 PID: 6623 at
drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h:172 nvkm_dp_enable+0xf2/0=
x110
[nouveau]
kernel: Modules linked in: cmac nls_iso8859_1 nls_cp437 vfat fat snd_usb_au=
dio
snd_usbmidi_lib snd_rawmidi snd_seq_device hid_generic usbhid hid rfcomm ccm
fuse bnep 8021q garp mrp stp llc joydev mousedev arc4 snd_hda_codec_hdmi
nouveau i915 intel_rapl mei_hdcp mei_wdt x86_pkg_temp_thermal intel_powercl=
amp
coretemp kvm_intel iwlmvm >
kernel:  fb_sys_fops mei_me intel_uncore ecdh_generic rtsx_pci_ms input_leds
i2c_i801 pcspkr rfkill memstick mei lpc_ich soundcore intel_rapl_perf psmou=
se
ie31200_edac parport_pc tpm_tis tpm_tis_core hp_accel battery parport lis3l=
v02d
input_polldev evdev mac_hid tpm wmi pcc_cpufreq rng_core hp_wireless ac sg
crypto_user ip_tables x_>
kernel: CPU: 0 PID: 6623 Comm: kworker/0:2 Tainted: G        W=20=20=20=20=
=20=20=20=20
5.1.16-arch1-1-ARCH #1
kernel: Hardware name: Hewlett-Packard HP ZBook 17 G2/2255, BIOS M70 Ver. 0=
1.24
04/17/2019
kernel: Workqueue: events nvkm_notify_work [nouveau]
kernel: RIP: 0010:nvkm_dp_enable+0xf2/0x110 [nouveau]
kernel: Code: 00 4c 89 e7 4c 8d 83 09 01 00 00 be 01 00 00 00 e8 23 04 fd f=
f 85
c0 74 0a 4c 89 e7 e8 37 02 fd ff eb 81 80 7c 24 07 10 74 02 <0f> 0b 4c 89 e=
7 e8
24 02 fd ff 89 e8 eb 83 e8 eb 2e 67 e1 66 66 2e
kernel: RSP: 0018:ffff8ff1c9717df8 EFLAGS: 00010287
kernel: RAX: 0000000000000000 RBX: ffff8c2139352600 RCX: ffff8ff1c9717dff
kernel: RDX: ffff8ff1c9717da8 RSI: ffff8ff1c700e5d4 RDI: ffff8ff1c700e5d4
kernel: RBP: 0000000000000001 R08: 0000000000000000 R09: ffff8ff1c9717dff
kernel: R10: 0000000000000000 R11: 0000000000000018 R12: ffff8c2126c77800
kernel: R13: ffff8c2126d8a840 R14: 0000000000000000 R15: 0ffff8c213fc2770
kernel: FS:  0000000000000000(0000) GS:ffff8c213fc00000(0000)
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 000035c1066b1020 CR3: 0000000859c0e004 CR4: 00000000001606f0
kernel: Call Trace:
kernel:  nvkm_dp_hpd+0xf1/0x100 [nouveau]
kernel:  nvkm_notify_work+0x1d/0x80 [nouveau]
kernel:  process_one_work+0x1d1/0x3e0
kernel:  worker_thread+0x4a/0x3d0
kernel:  kthread+0xfb/0x130
kernel:  ? process_one_work+0x3e0/0x3e0
kernel:  ? kthread_park+0x90/0x90
kernel:  ret_from_fork+0x35/0x40
kernel: ---[ end trace d1860b58087867eb ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15627272361.2F08B6CeE.32033
Date: Wed, 10 Jul 2019 02:53:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:jhnmlkvch=
9&#64;gmail.com" title=3D"JM9 &lt;jhnmlkvch9&#64;gmail.com&gt;"> <span clas=
s=3D"fn">JM9</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Resume up from suspend sometimes freezes system (Optimus/=
Nouveau)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111044">bug 11104=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>xorg-team&#64;lists.x.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>chris&#64;chris-wilson.co.uk
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>Driver/intel
           </td>
           <td>Driver/nouveau
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Resume up from suspend sometimes freezes system (Optimus/=
Nouveau)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111044#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Resume up from suspend sometimes freezes system (Optimus/=
Nouveau)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111044">bug 11104=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jhnmlkvch9&#64;gmail.com" title=3D"JM9 &lt;jhnmlkvch9&#64;gmail.com&gt;"> <=
span class=3D"fn">JM9</span></a>
</span></b>
        <pre>So I ran into this again and on the way back, stopped off at o=
ffice to
reconnect monitors to see if  it will wake up. Unfortunately, that didn't w=
ork.
But I was able to get this from the journal. Hope it is of some help:

LID opened
ACPI action undefined: PNP0C0A:00
kernel: WARNING: CPU: 0 PID: 6623 at
drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h:172 nvkm_dp_enable+0xf2/0=
x110
[nouveau]
kernel: Modules linked in: cmac nls_iso8859_1 nls_cp437 vfat fat snd_usb_au=
dio
snd_usbmidi_lib snd_rawmidi snd_seq_device hid_generic usbhid hid rfcomm ccm
fuse bnep 8021q garp mrp stp llc joydev mousedev arc4 snd_hda_codec_hdmi
nouveau i915 intel_rapl mei_hdcp mei_wdt x86_pkg_temp_thermal intel_powercl=
amp
coretemp kvm_intel iwlmvm &gt;
kernel:  fb_sys_fops mei_me intel_uncore ecdh_generic rtsx_pci_ms input_leds
i2c_i801 pcspkr rfkill memstick mei lpc_ich soundcore intel_rapl_perf psmou=
se
ie31200_edac parport_pc tpm_tis tpm_tis_core hp_accel battery parport lis3l=
v02d
input_polldev evdev mac_hid tpm wmi pcc_cpufreq rng_core hp_wireless ac sg
crypto_user ip_tables x_&gt;
kernel: CPU: 0 PID: 6623 Comm: kworker/0:2 Tainted: G        W=20=20=20=20=
=20=20=20=20
5.1.16-arch1-1-ARCH #1
kernel: Hardware name: Hewlett-Packard HP ZBook 17 G2/2255, BIOS M70 Ver. 0=
1.24
04/17/2019
kernel: Workqueue: events nvkm_notify_work [nouveau]
kernel: RIP: 0010:nvkm_dp_enable+0xf2/0x110 [nouveau]
kernel: Code: 00 4c 89 e7 4c 8d 83 09 01 00 00 be 01 00 00 00 e8 23 04 fd f=
f 85
c0 74 0a 4c 89 e7 e8 37 02 fd ff eb 81 80 7c 24 07 10 74 02 &lt;0f&gt; 0b 4=
c 89 e7 e8
24 02 fd ff 89 e8 eb 83 e8 eb 2e 67 e1 66 66 2e
kernel: RSP: 0018:ffff8ff1c9717df8 EFLAGS: 00010287
kernel: RAX: 0000000000000000 RBX: ffff8c2139352600 RCX: ffff8ff1c9717dff
kernel: RDX: ffff8ff1c9717da8 RSI: ffff8ff1c700e5d4 RDI: ffff8ff1c700e5d4
kernel: RBP: 0000000000000001 R08: 0000000000000000 R09: ffff8ff1c9717dff
kernel: R10: 0000000000000000 R11: 0000000000000018 R12: ffff8c2126c77800
kernel: R13: ffff8c2126d8a840 R14: 0000000000000000 R15: 0ffff8c213fc2770
kernel: FS:  0000000000000000(0000) GS:ffff8c213fc00000(0000)
knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 000035c1066b1020 CR3: 0000000859c0e004 CR4: 00000000001606f0
kernel: Call Trace:
kernel:  nvkm_dp_hpd+0xf1/0x100 [nouveau]
kernel:  nvkm_notify_work+0x1d/0x80 [nouveau]
kernel:  process_one_work+0x1d1/0x3e0
kernel:  worker_thread+0x4a/0x3d0
kernel:  kthread+0xfb/0x130
kernel:  ? process_one_work+0x3e0/0x3e0
kernel:  ? kthread_park+0x90/0x90
kernel:  ret_from_fork+0x35/0x40
kernel: ---[ end trace d1860b58087867eb ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15627272361.2F08B6CeE.32033--

--===============2115574994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2115574994==--
