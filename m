Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6564ECC958
	for <lists+nouveau@lfdr.de>; Sat,  5 Oct 2019 12:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62A26E1EC;
	Sat,  5 Oct 2019 10:22:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 28F6C6E22D
 for <nouveau@lists.freedesktop.org>; Sat,  5 Oct 2019 10:22:51 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 25D4672162; Sat,  5 Oct 2019 10:22:51 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sat, 05 Oct 2019 10:22:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lukas@wunner.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-75985-8800-PXTUIwnxMn@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0943346693=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0943346693==
Content-Type: multipart/alternative; boundary="15702709711.B68ae1.27310"
Content-Transfer-Encoding: 7bit


--15702709711.B68ae1.27310
Date: Sat, 5 Oct 2019 10:22:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #110 from Lukas Wunner <lukas@wunner.de> ---
(In reply to Przemys=C5=82aw Kopa from comment #109)
> Created attachment 145640 [details]
> Dmesg dump to present the problem of NVIDIA HDA not suspending correctly =
#2.

Thanks. This is the same issue as bug #106957, only that one was for AMD ca=
rds
and yours is an Nvidia. It was fixed by commit 57cb54e53bdd ("ALSA: hda - F=
orce
to link down at runtime suspend on ATI/AMD HDMI").

If you add "codec->link_down_at_suspend =3D 1;" to patch_nvhdmi() in
sound/pci/hda/patch_hdmi.c, the issue may go away.

The only question is whether your card's revision_id is listed in
snd_hda_id_hdmi[] such that patch_nvhdmi() is executed for your card. What =
does
"cat /sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/revision_id" say?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15702709711.B68ae1.27310
Date: Sat, 5 Oct 2019 10:22:51 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c110">Comme=
nt # 110</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukas&#64;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <s=
pan class=3D"fn">Lukas Wunner</span></a>
</span></b>
        <pre>(In reply to Przemys=C5=82aw Kopa from <a href=3D"show_bug.cgi=
?id=3D75985#c109">comment #109</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D145640" name=3D"attach_145640" title=3D"Dmesg dump to present the p=
roblem of NVIDIA HDA not suspending correctly #2.">attachment 145640</a> <a=
 href=3D"attachment.cgi?id=3D145640&amp;action=3Dedit" title=3D"Dmesg dump =
to present the problem of NVIDIA HDA not suspending correctly #2.">[details=
]</a></span>
&gt; Dmesg dump to present the problem of NVIDIA HDA not suspending correct=
ly #2.</span >

Thanks. This is the same issue as <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - GPU runtime suspend broken since 4.17"
   href=3D"show_bug.cgi?id=3D106957">bug #106957</a>, only that one was for=
 AMD cards
and yours is an Nvidia. It was fixed by commit 57cb54e53bdd (&quot;ALSA: hd=
a - Force
to link down at runtime suspend on ATI/AMD HDMI&quot;).

If you add &quot;codec-&gt;link_down_at_suspend =3D 1;&quot; to patch_nvhdm=
i() in
sound/pci/hda/patch_hdmi.c, the issue may go away.

The only question is whether your card's revision_id is listed in
snd_hda_id_hdmi[] such that patch_nvhdmi() is executed for your card. What =
does
&quot;cat /sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/revision_id&quot; s=
ay?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15702709711.B68ae1.27310--

--===============0943346693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0943346693==--
