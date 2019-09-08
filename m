Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D531ACBA7
	for <lists+nouveau@lfdr.de>; Sun,  8 Sep 2019 10:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E85F89B69;
	Sun,  8 Sep 2019 08:46:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D953899DC
 for <nouveau@lists.freedesktop.org>; Sun,  8 Sep 2019 08:46:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 98DD972167; Sun,  8 Sep 2019 08:46:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 08 Sep 2019 08:46:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.dybczak@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-100423-8800-SgucPZEIhU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-100423-8800@http.bugs.freedesktop.org/>
References: <bug-100423-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 100423] MMIO read of 00000000 FAULT at 022554 [ IBUS
 ]
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
Content-Type: multipart/mixed; boundary="===============2134659734=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============2134659734==
Content-Type: multipart/alternative; boundary="15679323853.8ca88aAe.6418"
Content-Transfer-Encoding: 7bit


--15679323853.8ca88aAe.6418
Date: Sun, 8 Sep 2019 08:46:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

--- Comment #30 from michal.dybczak@gmail.com ---
This is concerning that after all this time (2,5 year) this issue is still
here.

I have the same issue shown in journalctl. I believe it wasn't there from t=
he
start but showed a while ago. I don't see any problems on the frontend site,
however.
I have a hybrid GPUs and currently use optimus-manager to switch between GP=
Us.
Nouevau is making the switch (successfully).

Here is the bug:

nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 022554 [ IBUS ]

My laptop is:

System:    Host: alienware-PC Kernel: 5.2.13-1-MANJARO x86_64 bits: 64
compiler: gcc v: 9.1.0 Desktop: KDE Plasma 5.16.5=20
           tk: Qt 5.13.0 wm: kwin_x11 dm: SDDM Distro: Manjaro Linux=20
Machine:   Type: Laptop System: Alienware product: Alienware 17 R3 v: 1.7.0
serial: <filter> Chassis: type: 10=20
           serial: <filter>=20
           Mobo: Alienware model: 0GH72M v: A00 serial: <filter> UEFI:
Alienware v: 1.7.0 date: 01/18/2019=20
Battery:   ID-1: BAT1 charge: 95.8 Wh condition: 95.8/96.0 Wh (100%) volts:
17.3/15.0 model: COMPAL PABAS0241231=20
           serial: <filter> status: Full=20
CPU:       Topology: Quad Core model: Intel Core i7-6700HQ bits: 64 type: MT
MCP arch: Skylake-S rev: 3 L2 cache: 6144 KiB=20
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx
bogomips: 41488=20
           Speed: 933 MHz min/max: 800/3500 MHz Core speeds (MHz): 1: 900 2:
900 3: 900 4: 900 5: 900 6: 900 7: 900 8: 900=20
Graphics:  Device-1: Intel HD Graphics 530 vendor: Dell driver: i915 v: ker=
nel
bus ID: 00:02.0 chip ID: 8086:191b=20
           Device-2: NVIDIA GM204M [GeForce GTX 970M] vendor: Dell driver:
nouveau v: kernel bus ID: 01:00.0=20
           chip ID: 10de:13d8=20
           Display: x11 server: X.Org 1.20.5 driver: modesetting compositor:
kwin_x11 tty: N/A=20
           OpenGL: renderer: Mesa DRI Intel HD Graphics 530 (Skylake GT2) v:
4.5 Mesa 19.1.6 compat-v: 3.0 direct render: Yes=20
Audio:     Device-1: Intel 100 Series/C230 Series Family HD Audio vendor: D=
ell
driver: snd_hda_intel v: kernel bus ID: 00:1f.3=20
           chip ID: 8086:a170=20
           Sound Server: ALSA v: k5.2.13-1-MANJARO=20
Network:   Device-1: Qualcomm Atheros Killer E2400 Gigabit Ethernet driver:=
 alx
v: kernel port: d000 bus ID: 3b:00.0=20
           chip ID: 1969:e0a1=20
           IF: enp59s0 state: down mac: <filter>=20
           Device-2: Qualcomm Atheros QCA6174 802.11ac Wireless Network Ada=
pter
vendor: Bigfoot Networks driver: ath10k_pci=20
           v: kernel port: d000 bus ID: 3c:00.0 chip ID: 168c:003e=20
           IF: wlp60s0 state: up mac: <filter>=20
           Device-3: Qualcomm Atheros type: USB driver: btusb bus ID: 1-5:4
chip ID: 0cf3:e300=20
Drives:    Local Storage: total: 1.02 TiB used: 730.08 GiB (70.0%)=20
           ID-1: /dev/sda vendor: Kingston model: SM2280S3G2120G size: 111.=
79
GiB speed: 6.0 Gb/s serial: <filter>=20
           ID-2: /dev/sdb vendor: HGST (Hitachi) model: HTS721010A9E630 siz=
e:
931.51 GiB speed: 6.0 Gb/s serial: <filter>=20
RAID:      Hardware-1: Intel 82801 Mobile SATA Controller [RAID mode] drive=
r:
ahci v: 3.0 bus ID: 00:17.0 chip ID: 8086.282a=20
Partition: ID-1: / size: 38.32 GiB used: 30.85 GiB (80.5%) fs: ext4 dev:
/dev/sda4=20
           ID-2: /home size: 71.26 GiB used: 57.85 GiB (81.2%) fs: ext4 dev:
/dev/sda2=20
Sensors:   System Temperatures: cpu: 54.5 C mobo: N/A gpu: nouveau temp: 54=
 C=20
           Fan Speeds (RPM): N/A=20
Info:      Processes: 262 Uptime: 5m Memory: 7.66 GiB used: 2.53 GiB (33.0%)
Init: systemd v: 243 Compilers: gcc: 9.1.0=20
           clang: 8.0.1 Shell: bash v: 5.0.11 running in: konsole inxi: 3.0=
.36

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15679323853.8ca88aAe.6418
Date: Sun, 8 Sep 2019 08:46:25 +0000
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
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c30">Comme=
nt # 30</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michal.dybczak&#64;gmail.com" title=3D"michal.dybczak&#64;gmail.com">michal=
.dybczak&#64;gmail.com</a>
</span></b>
        <pre>This is concerning that after all this time (2,5 year) this is=
sue is still
here.

I have the same issue shown in journalctl. I believe it wasn't there from t=
he
start but showed a while ago. I don't see any problems on the frontend site,
however.
I have a hybrid GPUs and currently use optimus-manager to switch between GP=
Us.
Nouevau is making the switch (successfully).

Here is the bug:

nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 022554 [ IBUS ]

My laptop is:

System:    Host: alienware-PC Kernel: 5.2.13-1-MANJARO x86_64 bits: 64
compiler: gcc v: 9.1.0 Desktop: KDE Plasma 5.16.5=20
           tk: Qt 5.13.0 wm: kwin_x11 dm: SDDM Distro: Manjaro Linux=20
Machine:   Type: Laptop System: Alienware product: Alienware 17 R3 v: 1.7.0
serial: &lt;filter&gt; Chassis: type: 10=20
           serial: &lt;filter&gt;=20
           Mobo: Alienware model: 0GH72M v: A00 serial: &lt;filter&gt; UEFI:
Alienware v: 1.7.0 date: 01/18/2019=20
Battery:   ID-1: BAT1 charge: 95.8 Wh condition: 95.8/96.0 Wh (100%) volts:
17.3/15.0 model: COMPAL PABAS0241231=20
           serial: &lt;filter&gt; status: Full=20
CPU:       Topology: Quad Core model: Intel Core i7-6700HQ bits: 64 type: MT
MCP arch: Skylake-S rev: 3 L2 cache: 6144 KiB=20
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx
bogomips: 41488=20
           Speed: 933 MHz min/max: 800/3500 MHz Core speeds (MHz): 1: 900 2:
900 3: 900 4: 900 5: 900 6: 900 7: 900 8: 900=20
Graphics:  Device-1: Intel HD Graphics 530 vendor: Dell driver: i915 v: ker=
nel
bus ID: 00:02.0 chip ID: 8086:191b=20
           Device-2: NVIDIA GM204M [GeForce GTX 970M] vendor: Dell driver:
nouveau v: kernel bus ID: 01:00.0=20
           chip ID: 10de:13d8=20
           Display: x11 server: X.Org 1.20.5 driver: modesetting compositor:
kwin_x11 tty: N/A=20
           OpenGL: renderer: Mesa DRI Intel HD Graphics 530 (Skylake GT2) v:
4.5 Mesa 19.1.6 compat-v: 3.0 direct render: Yes=20
Audio:     Device-1: Intel 100 Series/C230 Series Family HD Audio vendor: D=
ell
driver: snd_hda_intel v: kernel bus ID: 00:1f.3=20
           chip ID: 8086:a170=20
           Sound Server: ALSA v: k5.2.13-1-MANJARO=20
Network:   Device-1: Qualcomm Atheros Killer E2400 Gigabit Ethernet driver:=
 alx
v: kernel port: d000 bus ID: 3b:00.0=20
           chip ID: 1969:e0a1=20
           IF: enp59s0 state: down mac: &lt;filter&gt;=20
           Device-2: Qualcomm Atheros QCA6174 802.11ac Wireless Network Ada=
pter
vendor: Bigfoot Networks driver: ath10k_pci=20
           v: kernel port: d000 bus ID: 3c:00.0 chip ID: 168c:003e=20
           IF: wlp60s0 state: up mac: &lt;filter&gt;=20
           Device-3: Qualcomm Atheros type: USB driver: btusb bus ID: 1-5:4
chip ID: 0cf3:e300=20
Drives:    Local Storage: total: 1.02 TiB used: 730.08 GiB (70.0%)=20
           ID-1: /dev/sda vendor: Kingston model: SM2280S3G2120G size: 111.=
79
GiB speed: 6.0 Gb/s serial: &lt;filter&gt;=20
           ID-2: /dev/sdb vendor: HGST (Hitachi) model: HTS721010A9E630 siz=
e:
931.51 GiB speed: 6.0 Gb/s serial: &lt;filter&gt;=20
RAID:      Hardware-1: Intel 82801 Mobile SATA Controller [RAID mode] drive=
r:
ahci v: 3.0 bus ID: 00:17.0 chip ID: 8086.282a=20
Partition: ID-1: / size: 38.32 GiB used: 30.85 GiB (80.5%) fs: ext4 dev:
/dev/sda4=20
           ID-2: /home size: 71.26 GiB used: 57.85 GiB (81.2%) fs: ext4 dev:
/dev/sda2=20
Sensors:   System Temperatures: cpu: 54.5 C mobo: N/A gpu: nouveau temp: 54=
 C=20
           Fan Speeds (RPM): N/A=20
Info:      Processes: 262 Uptime: 5m Memory: 7.66 GiB used: 2.53 GiB (33.0%)
Init: systemd v: 243 Compilers: gcc: 9.1.0=20
           clang: 8.0.1 Shell: bash v: 5.0.11 running in: konsole inxi: 3.0=
.36</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15679323853.8ca88aAe.6418--

--===============2134659734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2134659734==--
