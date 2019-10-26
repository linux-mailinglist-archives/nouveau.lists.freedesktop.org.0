Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A47E5E2E
	for <lists+nouveau@lfdr.de>; Sat, 26 Oct 2019 19:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749686E0EB;
	Sat, 26 Oct 2019 17:26:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id DD1BC6E10E
 for <nouveau@lists.freedesktop.org>; Sat, 26 Oct 2019 17:26:37 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D5636720E0; Sat, 26 Oct 2019 17:26:37 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 26 Oct 2019 17:26:37 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: dooby.dave@virgin.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112070-8800-3czYDW0Ws7@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112070-8800@http.bugs.freedesktop.org/>
References: <bug-112070-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 112070] H/W Acceleration sufficiently buggy on
 Debian to hard lock machine GeForce 7600 GO
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
Content-Type: multipart/mixed; boundary="===============1931766841=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1931766841==
Content-Type: multipart/alternative; boundary="15721107972.4e1EDb.21542"
Content-Transfer-Encoding: 7bit


--15721107972.4e1EDb.21542
Date: Sat, 26 Oct 2019 17:26:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112070

--- Comment #27 from Doobz <dooby.dave@virgin.net> ---
I've been looking at the interrupts, and pretty sure something is amiss. nv=
km
does tick away quite rapidly 50+/sec, but it's by no means the worst.

cat /proc/interrupts=20
           CPU0       CPU1=20=20=20=20=20=20=20
  0:     884041          0   IO-APIC   2-edge      timer
  1:        943          0   IO-APIC   1-edge      i8042
  8:          0          1   IO-APIC   8-edge      rtc0
  9:          0      71944   IO-APIC   9-fasteoi   acpi
 12:          0     407479   IO-APIC  12-edge      i8042
 14:      15003          0   IO-APIC  14-edge      ata_piix
 15:          0          0   IO-APIC  15-edge      ata_piix
 16:       4422          0   IO-APIC  16-fasteoi   yenta, uhci_hcd:usb5
 17:          0          0   IO-APIC  17-fasteoi   mmc0, mmc1
 18:          0        184   IO-APIC  18-fasteoi   uhci_hcd:usb4
 19:          0          0   IO-APIC  19-fasteoi   uhci_hcd:usb3, i801_smbus
 20:          0          2   IO-APIC  20-fasteoi   firewire_ohci
 23:          0          3   IO-APIC  23-fasteoi   uhci_hcd:usb1, ehci_hcd:=
usb2
 29:      89581      51828   PCI-MSI 524288-edge      nvkm
 30:          0        518   PCI-MSI 442368-edge      snd_hda_intel:card0
 31:      54496      31631   PCI-MSI 2621440-edge      iwl3945
 32:          0          3   PCI-MSI 2097152-edge      enp4s0
NMI:          7          8   Non-maskable interrupts
LOC:     117697     732513   Local timer interrupts
SPU:          0          0   Spurious interrupts
PMI:          7          8   Performance monitoring interrupts
IWI:     157032     144987   IRQ work interrupts
RTR:          0          0   APIC ICR read retries
RES:      99916     105307   Rescheduling interrupts
CAL:      43819      44884   Function call interrupts
TLB:      93370      93058   TLB shootdowns
TRM:          0          0   Thermal event interrupts
THR:          0          0   Threshold APIC interrupts
DFR:          0          0   Deferred Error APIC interrupts
MCE:          0          0   Machine check exceptions
MCP:          9          9   Machine check polls

This was after 45mins.

I was chasing interrupt issues on windows on this laptop. Never got it suss=
ed.
It was fine in safe mode, but not booted normally.

Looking at the desktop(hp gf7100), it has no massive number on line 0 timer,
and no acpi ones either. Nvkm is ticking at similar rate to laptop, but the=
re
is one line going up faster. Ill leave it on for a similar time and post it
here for comparison.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15721107972.4e1EDb.21542
Date: Sat, 26 Oct 2019 17:26:37 +0000
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
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070#c27">Comme=
nt # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070">bug 11207=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dooby.dave&#64;virgin.net" title=3D"Doobz &lt;dooby.dave&#64;virgin.net&gt;=
"> <span class=3D"fn">Doobz</span></a>
</span></b>
        <pre>I've been looking at the interrupts, and pretty sure something=
 is amiss. nvkm
does tick away quite rapidly 50+/sec, but it's by no means the worst.

cat /proc/interrupts=20
           CPU0       CPU1=20=20=20=20=20=20=20
  0:     884041          0   IO-APIC   2-edge      timer
  1:        943          0   IO-APIC   1-edge      i8042
  8:          0          1   IO-APIC   8-edge      rtc0
  9:          0      71944   IO-APIC   9-fasteoi   acpi
 12:          0     407479   IO-APIC  12-edge      i8042
 14:      15003          0   IO-APIC  14-edge      ata_piix
 15:          0          0   IO-APIC  15-edge      ata_piix
 16:       4422          0   IO-APIC  16-fasteoi   yenta, uhci_hcd:usb5
 17:          0          0   IO-APIC  17-fasteoi   mmc0, mmc1
 18:          0        184   IO-APIC  18-fasteoi   uhci_hcd:usb4
 19:          0          0   IO-APIC  19-fasteoi   uhci_hcd:usb3, i801_smbus
 20:          0          2   IO-APIC  20-fasteoi   firewire_ohci
 23:          0          3   IO-APIC  23-fasteoi   uhci_hcd:usb1, ehci_hcd:=
usb2
 29:      89581      51828   PCI-MSI 524288-edge      nvkm
 30:          0        518   PCI-MSI 442368-edge      snd_hda_intel:card0
 31:      54496      31631   PCI-MSI 2621440-edge      iwl3945
 32:          0          3   PCI-MSI 2097152-edge      enp4s0
NMI:          7          8   Non-maskable interrupts
LOC:     117697     732513   Local timer interrupts
SPU:          0          0   Spurious interrupts
PMI:          7          8   Performance monitoring interrupts
IWI:     157032     144987   IRQ work interrupts
RTR:          0          0   APIC ICR read retries
RES:      99916     105307   Rescheduling interrupts
CAL:      43819      44884   Function call interrupts
TLB:      93370      93058   TLB shootdowns
TRM:          0          0   Thermal event interrupts
THR:          0          0   Threshold APIC interrupts
DFR:          0          0   Deferred Error APIC interrupts
MCE:          0          0   Machine check exceptions
MCP:          9          9   Machine check polls

This was after 45mins.

I was chasing interrupt issues on windows on this laptop. Never got it suss=
ed.
It was fine in safe mode, but not booted normally.

Looking at the desktop(hp gf7100), it has no massive number on line 0 timer,
and no acpi ones either. Nvkm is ticking at similar rate to laptop, but the=
re
is one line going up faster. Ill leave it on for a similar time and post it
here for comparison.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15721107972.4e1EDb.21542--

--===============1931766841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1931766841==--
