Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5ADE5E9D
	for <lists+nouveau@lfdr.de>; Sat, 26 Oct 2019 20:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8216A6E111;
	Sat, 26 Oct 2019 18:21:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B1D5B6E111
 for <nouveau@lists.freedesktop.org>; Sat, 26 Oct 2019 18:21:47 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A3366720E2; Sat, 26 Oct 2019 18:21:47 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 26 Oct 2019 18:21:47 +0000
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
Message-ID: <bug-112070-8800-KOH5knhksE@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0754968619=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0754968619==
Content-Type: multipart/alternative; boundary="15721141070.Ccb5D.2299"
Content-Transfer-Encoding: 7bit


--15721141070.Ccb5D.2299
Date: Sat, 26 Oct 2019 18:21:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112070

--- Comment #28 from Doobz <dooby.dave@virgin.net> ---
> cat /proc/interrupts=20
           CPU0       CPU1=20=20=20=20=20=20=20
  0:          8          0   IO-APIC   2-edge      timer
  1:          0        438   IO-APIC   1-edge      i8042
  8:          1          0   IO-APIC   8-edge      rtc0
  9:          0          0   IO-APIC   9-fasteoi   acpi
 12:     161488          0   IO-APIC  12-edge      i8042
 14:          0          0   IO-APIC  14-edge      pata_amd
 15:          0          0   IO-APIC  15-edge      pata_amd
 19:          0          2   IO-APIC  19-fasteoi   firewire_ohci
 20:      92448          0   IO-APIC  20-fasteoi   nvkm
 21:          0       9323   IO-APIC  21-fasteoi   ahci[0000:00:0e.0]
 22:     143237          0   IO-APIC  22-fasteoi   ehci_hcd:usb1,
snd_hda_intel:card0
 23:          0          0   IO-APIC  23-fasteoi   ohci_hcd:usb2
 27:        803       2879   PCI-MSI 245760-edge      enp0s15
NMI:        124        113   Non-maskable interrupts
LOC:     426946     389908   Local timer interrupts
SPU:          0          0   Spurious interrupts
PMI:        124        113   Performance monitoring interrupts
IWI:     148823     138382   IRQ work interrupts
RTR:          0          0   APIC ICR read retries
RES:       6984       6476   Rescheduling interrupts
CAL:       2349       1588   Function call interrupts
TLB:        565        358   TLB shootdowns
TRM:          0          0   Thermal event interrupts
THR:          0          0   Threshold APIC interrupts
DFR:          0          0   Deferred Error APIC interrupts
MCE:          0          0   Machine check exceptions
MCP:         10         10   Machine check polls
HYP:          0          0   Hypervisor callback interrupts
HRE:          0          0   Hyper-V reenlightenment interrupts
HVS:          0          0   Hyper-V stimer0 interrupts
ERR:          1

Given that there's no usb devices plugged in I'm a little suspicious of
22:     143237          0   IO-APIC  22-fasteoi   ehci_hcd:usb1,

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15721141070.Ccb5D.2299
Date: Sat, 26 Oct 2019 18:21:47 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070#c28">Comme=
nt # 28</a>
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
        <pre><span class=3D"quote">&gt; cat /proc/interrupts </span >
           CPU0       CPU1=20=20=20=20=20=20=20
  0:          8          0   IO-APIC   2-edge      timer
  1:          0        438   IO-APIC   1-edge      i8042
  8:          1          0   IO-APIC   8-edge      rtc0
  9:          0          0   IO-APIC   9-fasteoi   acpi
 12:     161488          0   IO-APIC  12-edge      i8042
 14:          0          0   IO-APIC  14-edge      pata_amd
 15:          0          0   IO-APIC  15-edge      pata_amd
 19:          0          2   IO-APIC  19-fasteoi   firewire_ohci
 20:      92448          0   IO-APIC  20-fasteoi   nvkm
 21:          0       9323   IO-APIC  21-fasteoi   ahci[0000:00:0e.0]
 22:     143237          0   IO-APIC  22-fasteoi   ehci_hcd:usb1,
snd_hda_intel:card0
 23:          0          0   IO-APIC  23-fasteoi   ohci_hcd:usb2
 27:        803       2879   PCI-MSI 245760-edge      enp0s15
NMI:        124        113   Non-maskable interrupts
LOC:     426946     389908   Local timer interrupts
SPU:          0          0   Spurious interrupts
PMI:        124        113   Performance monitoring interrupts
IWI:     148823     138382   IRQ work interrupts
RTR:          0          0   APIC ICR read retries
RES:       6984       6476   Rescheduling interrupts
CAL:       2349       1588   Function call interrupts
TLB:        565        358   TLB shootdowns
TRM:          0          0   Thermal event interrupts
THR:          0          0   Threshold APIC interrupts
DFR:          0          0   Deferred Error APIC interrupts
MCE:          0          0   Machine check exceptions
MCP:         10         10   Machine check polls
HYP:          0          0   Hypervisor callback interrupts
HRE:          0          0   Hyper-V reenlightenment interrupts
HVS:          0          0   Hyper-V stimer0 interrupts
ERR:          1

Given that there's no usb devices plugged in I'm a little suspicious of
22:     143237          0   IO-APIC  22-fasteoi   ehci_hcd:usb1,</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15721141070.Ccb5D.2299--

--===============0754968619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0754968619==--
