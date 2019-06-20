Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A754F4C85E
	for <lists+nouveau@lfdr.de>; Thu, 20 Jun 2019 09:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23B8895F5;
	Thu, 20 Jun 2019 07:25:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54B916E55C
 for <nouveau@lists.freedesktop.org>; Thu, 20 Jun 2019 07:25:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 523B372167; Thu, 20 Jun 2019 07:25:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 20 Jun 2019 07:25:33 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dan@reactivated.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-75985-8800-g6LyosKHR6@http.bugs.freedesktop.org/>
In-Reply-To: <bug-75985-8800@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
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
Content-Type: multipart/mixed; boundary="===============1368505927=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1368505927==
Content-Type: multipart/alternative; boundary="15610155342.cCd01d.18494"
Content-Transfer-Encoding: 7bit


--15610155342.cCd01d.18494
Date: Thu, 20 Jun 2019 07:25:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #77 from Daniel Drake <dan@reactivated.net> ---
Created attachment 144596
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144596&action=3Dedit
Acer Predator G3-572 acpidump

Martin Lopat=C3=A1=C5=99, thanks for the analysis above, sorry I missed tho=
se details
before!

Checking on my Acer Predator G3-572 (acpidump attached here), I can see what
you're referring to in SSDT5:

        OperationRegion (PCNV, SystemMemory, \_SB.PCI0.PEG0.PEGP.EBAS, 0x10=
00)
        Field (PCNV, AnyAcc, NoLock, Preserve)
        {
            Offset (0x488),=20
                ,   25,=20
            MLTF,   1
        }

        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
        {
            If (DGOS)
            {
                If ((\_SB.PCI0.PEG0.PEGP.DPCS !=3D Zero))
                {
                    \_SB.PCI0.PEG0.PEGP._ON ()
                    DGOS =3D Zero
                }
            }
            ElseIf ((\_SB.PCI0.PEG0.DVID !=3D 0xFFFF))
            {
                If ((GGIV (0x01080001) =3D=3D Zero))
                {
                    MLTF =3D Zero
                }
                Else
                {
                    MLTF =3D One
                    \_SB.PCI0.PEG0.PEGP.NASV =3D \_SB.PCI0.PEG0.PEGP.DSSV
                }
            }
        }

MLTF presumably means multifunction and it's exactly the bit we've been wor=
king
with. But I haven't yet managed to get _PS0 to run this code. I get to the
GGIV(0x01080001) call, but it returns 0, so the bit doesn't get set.

I looked for some obvious connection to stuff in _DSM but I can't spot
anything. Can you clarify exactly what you saw that links _DSM and _PS0
together, and share your acpidump?

I tried understanding what GGIV() does but nothing is clear there. It ends =
up
reading bit 1 from physical memory address 0xfdac0408 which is under:
pci_bus 0000:00: resource 21 [mem 0xfd000000-0xfe7fffff window]
and I can't immediately spot any ACPI code that writes to that address.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15610155342.cCd01d.18494
Date: Thu, 20 Jun 2019 07:25:34 +0000
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
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c77">Commen=
t # 77</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dan&#64;reactivated.net" title=3D"Daniel Drake &lt;dan&#64;reactivated.net&=
gt;"> <span class=3D"fn">Daniel Drake</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144596=
" name=3D"attach_144596" title=3D"Acer Predator G3-572 acpidump">attachment=
 144596</a> <a href=3D"attachment.cgi?id=3D144596&amp;action=3Dedit" title=
=3D"Acer Predator G3-572 acpidump">[details]</a></span>
Acer Predator G3-572 acpidump

Martin Lopat=C3=A1=C5=99, thanks for the analysis above, sorry I missed tho=
se details
before!

Checking on my Acer Predator G3-572 (acpidump attached here), I can see what
you're referring to in SSDT5:

        OperationRegion (PCNV, SystemMemory, \_SB.PCI0.PEG0.PEGP.EBAS, 0x10=
00)
        Field (PCNV, AnyAcc, NoLock, Preserve)
        {
            Offset (0x488),=20
                ,   25,=20
            MLTF,   1
        }

        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
        {
            If (DGOS)
            {
                If ((\_SB.PCI0.PEG0.PEGP.DPCS !=3D Zero))
                {
                    \_SB.PCI0.PEG0.PEGP._ON ()
                    DGOS =3D Zero
                }
            }
            ElseIf ((\_SB.PCI0.PEG0.DVID !=3D 0xFFFF))
            {
                If ((GGIV (0x01080001) =3D=3D Zero))
                {
                    MLTF =3D Zero
                }
                Else
                {
                    MLTF =3D One
                    \_SB.PCI0.PEG0.PEGP.NASV =3D \_SB.PCI0.PEG0.PEGP.DSSV
                }
            }
        }

MLTF presumably means multifunction and it's exactly the bit we've been wor=
king
with. But I haven't yet managed to get _PS0 to run this code. I get to the
GGIV(0x01080001) call, but it returns 0, so the bit doesn't get set.

I looked for some obvious connection to stuff in _DSM but I can't spot
anything. Can you clarify exactly what you saw that links _DSM and _PS0
together, and share your acpidump?

I tried understanding what GGIV() does but nothing is clear there. It ends =
up
reading bit 1 from physical memory address 0xfdac0408 which is under:
pci_bus 0000:00: resource 21 [mem 0xfd000000-0xfe7fffff window]
and I can't immediately spot any ACPI code that writes to that address.</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15610155342.cCd01d.18494--

--===============1368505927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1368505927==--
