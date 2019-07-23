Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFA172325
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2019 01:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B0A6E3F9;
	Tue, 23 Jul 2019 23:38:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5BF536E404
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jul 2019 23:38:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5900B72167; Tue, 23 Jul 2019 23:38:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 23 Jul 2019 23:38:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: aaron.hamid@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-99900-8800-6Q66YIAIom@http.bugs.freedesktop.org/>
In-Reply-To: <bug-99900-8800@http.bugs.freedesktop.org/>
References: <bug-99900-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 99900] [NVC1] nouveau: freeze / crash after kernel
 update to 4.10
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
Content-Type: multipart/mixed; boundary="===============0361433283=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0361433283==
Content-Type: multipart/alternative; boundary="15639251382.A35E79.20614"
Content-Transfer-Encoding: 7bit


--15639251382.A35E79.20614
Date: Tue, 23 Jul 2019 23:38:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99900

--- Comment #27 from aaron.hamid@gmail.com ---
I am encountering the same "kernel rejected pushbuf: Device or resource bus=
y"
crash/lock cited here and in
https://bugs.freedesktop.org/show_bug.cgi?id=3D100567
I'm posting here as I don't see SCHED_ERROR in my systemd journal, and I can
reliably trigger it by running qemu android emulator like kong in
https://bugs.freedesktop.org/show_bug.cgi?id=3D99900#c24 (so as far as I can
tell, unless resolved android development is dead for me)

Fedora 30
Linux noir 5.1.18-300.fc30.x86_64 #1 SMP Mon Jul 15 15:42:34 UTC 2019 x86_64
x86_64 x86_64 GNU/Linux

lsmod | grep nouveau
nouveau              2248704  10
mxm_wmi                16384  1 nouveau
i2c_algo_bit           16384  1 nouveau
drm_kms_helper        212992  1 nouveau
ttm                   114688  1 nouveau
drm                   495616  10 drm_kms_helper,ttm,nouveau
wmi                    36864  3 wmi_bmof,mxm_wmi,nouveau
video                  49152  1 nouveau

X11 Package:
xorg-x11-drv-nouveau.x86_64 1:1.0.15-7.fc30

About, Graphics: "NV134"

lspci -vs 01:00.0
01:00.0 VGA compatible controller: NVIDIA Corporation GP104 [GeForce GTX 10=
70
Ti] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Gigabyte Technology Co., Ltd Device 3794
        Flags: bus master, fast devsel, latency 0, IRQ 126
        Memory at a2000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at 90000000 (64-bit, prefetchable) [size=3D256M]
        Memory at a0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at 3000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: <access denied>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

journalctl

Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: kernel rejected
pushbuf: Device or resource busy
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: krec 0 pu=
shes
1 bufs 12 relocs 0
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
000
00000003 00000004 00000004 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
001
00000008 00000002 00000002 00000002
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
002
0000000a 00000002 00000002 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
003
00000006 00000004 00000000 00000004
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
004
00000007 00000002 00000002 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
005
00000021 00000002 00000002 00000002
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
006
00000013 00000004 00000004 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
007
0000003b 00000002 00000002 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
008
000000c1 00000002 00000000 00000002
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
009
0000007e 00000002 00000002 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
00a
00000049 00000002 00000002 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
00b
00000057 00000002 00000002 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: psh 00000=
000
000003ff10 0000041c54
....
Jul 23 18:56:50 noir kernel: nouveau 0000:01:00.0: Xwayland[2517]:
nv50cal_space: -16
...
Jul 23 18:56:50 noir kernel: nouveau 0000:01:00.0: Xwayland[2517]:
nv50cal_space: -16
Jul 23 18:56:51 noir kernel: nouveau 0000:01:00.0: Xwayland[2517]:
nv50cal_space: -16
Jul 23 18:56:51 noir kernel: nouveau 0000:01:00.0: Xwayland[2517]:
nv50cal_space: -16
Jul 23 18:56:52 noir kernel: nouveau 0000:01:00.0: Xwayland[2517]:
nv50cal_space: -16
Jul 23 18:56:52 noir kernel: nouveau 0000:01:00.0: Xwayland[2517]:
nv50cal_space: -16
...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15639251382.A35E79.20614
Date: Tue, 23 Jul 2019 23:38:58 +0000
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
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900#c27">Commen=
t # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900">bug 99900<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
aaron.hamid&#64;gmail.com" title=3D"aaron.hamid&#64;gmail.com">aaron.hamid&=
#64;gmail.com</a>
</span></b>
        <pre>I am encountering the same &quot;kernel rejected pushbuf: Devi=
ce or resource busy&quot;
crash/lock cited here and in
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"show_bug.cgi?id=3D100567">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D100567</a>
I'm posting here as I don't see SCHED_ERROR in my systemd journal, and I can
reliably trigger it by running qemu android emulator like kong in
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"show_bug.cgi?id=3D99900#c24">https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D99900#c24</a> (so as far as I can
tell, unless resolved android development is dead for me)

Fedora 30
Linux noir 5.1.18-300.fc30.x86_64 #1 SMP Mon Jul 15 15:42:34 UTC 2019 x86_64
x86_64 x86_64 GNU/Linux

lsmod | grep nouveau
nouveau              2248704  10
mxm_wmi                16384  1 nouveau
i2c_algo_bit           16384  1 nouveau
drm_kms_helper        212992  1 nouveau
ttm                   114688  1 nouveau
drm                   495616  10 drm_kms_helper,ttm,nouveau
wmi                    36864  3 wmi_bmof,mxm_wmi,nouveau
video                  49152  1 nouveau

X11 Package:
xorg-x11-drv-nouveau.x86_64 1:1.0.15-7.fc30

About, Graphics: &quot;NV134&quot;

lspci -vs 01:00.0
01:00.0 VGA compatible controller: NVIDIA Corporation GP104 [GeForce GTX 10=
70
Ti] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Gigabyte Technology Co., Ltd Device 3794
        Flags: bus master, fast devsel, latency 0, IRQ 126
        Memory at a2000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at 90000000 (64-bit, prefetchable) [size=3D256M]
        Memory at a0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at 3000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau

journalctl

Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: kernel rejected
pushbuf: Device or resource busy
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: krec 0 pu=
shes
1 bufs 12 relocs 0
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
000
00000003 00000004 00000004 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
001
00000008 00000002 00000002 00000002
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
002
0000000a 00000002 00000002 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
003
00000006 00000004 00000000 00000004
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
004
00000007 00000002 00000002 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
005
00000021 00000002 00000002 00000002
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
006
00000013 00000004 00000004 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
007
0000003b 00000002 00000002 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
008
000000c1 00000002 00000000 00000002
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
009
0000007e 00000002 00000002 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
00a
00000049 00000002 00000002 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: buf 00000=
00b
00000057 00000002 00000002 00000000
Jul 23 18:56:50 noir org.gnome.Shell.desktop[2455]: nouveau: ch6: psh 00000=
000
000003ff10 0000041c54
....
Jul 23 18:56:50 noir kernel: nouveau 0000:01:00.0: Xwayland[2517]:
nv50cal_space: -16
...
Jul 23 18:56:50 noir kernel: nouveau 0000:01:00.0: Xwayland[2517]:
nv50cal_space: -16
Jul 23 18:56:51 noir kernel: nouveau 0000:01:00.0: Xwayland[2517]:
nv50cal_space: -16
Jul 23 18:56:51 noir kernel: nouveau 0000:01:00.0: Xwayland[2517]:
nv50cal_space: -16
Jul 23 18:56:52 noir kernel: nouveau 0000:01:00.0: Xwayland[2517]:
nv50cal_space: -16
Jul 23 18:56:52 noir kernel: nouveau 0000:01:00.0: Xwayland[2517]:
nv50cal_space: -16
...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15639251382.A35E79.20614--

--===============0361433283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0361433283==--
