Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 475D7CEAFA
	for <lists+nouveau@lfdr.de>; Mon,  7 Oct 2019 19:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD9A6E123;
	Mon,  7 Oct 2019 17:51:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 68A1F6E673
 for <nouveau@lists.freedesktop.org>; Mon,  7 Oct 2019 17:51:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6538772162; Mon,  7 Oct 2019 17:51:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 07 Oct 2019 17:51:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: prymoo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-75985-8800-rupt4Xv2Df@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1058284572=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1058284572==
Content-Type: multipart/alternative; boundary="15704706801.0B5d1c.9879"
Content-Transfer-Encoding: 7bit


--15704706801.0B5d1c.9879
Date: Mon, 7 Oct 2019 17:51:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #111 from Przemys=C5=82aw Kopa <prymoo@gmail.com> ---
(In reply to Lukas Wunner from comment #110)
> What does "cat /sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/revision_id"=
 say?
It says: 0x100100

> If you add "codec->link_down_at_suspend =3D 1;" to patch_nvhdmi() in
> sound/pci/hda/patch_hdmi.c, the issue may go away.
>=20
> The only question is whether your card's revision_id is listed in
> snd_hda_id_hdmi[] such that patch_nvhdmi() is executed for your card.

I added "HDA_CODEC_ENTRY(0x10de0403, "GPU 0403 HDMI/DP", patch_nvhdmi)" to
snd_hda_id_hdmi[] (PCI ID of my Nvidia HDA wasn't there) and
"codec->link_down_at_suspend =3D 1;" to patch_nvhdmi(). With those changes =
dGPU
and HDA suspended normally (after echoing "auto" to HDA control file), so I
think that this is definiteley the right track!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15704706801.0B5d1c.9879
Date: Mon, 7 Oct 2019 17:51:20 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c111">Comme=
nt # 111</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
prymoo&#64;gmail.com" title=3D"Przemys=C5=82aw Kopa &lt;prymoo&#64;gmail.co=
m&gt;"> <span class=3D"fn">Przemys=C5=82aw Kopa</span></a>
</span></b>
        <pre>(In reply to Lukas Wunner from <a href=3D"show_bug.cgi?id=3D75=
985#c110">comment #110</a>)
<span class=3D"quote">&gt; What does &quot;cat /sys/bus/pci/devices/0000:01=
:00.1/hdaudioC1D0/revision_id&quot; say?</span >
It says: 0x100100

<span class=3D"quote">&gt; If you add &quot;codec-&gt;link_down_at_suspend =
=3D 1;&quot; to patch_nvhdmi() in
&gt; sound/pci/hda/patch_hdmi.c, the issue may go away.
&gt;=20
&gt; The only question is whether your card's revision_id is listed in
&gt; snd_hda_id_hdmi[] such that patch_nvhdmi() is executed for your card.<=
/span >

I added &quot;HDA_CODEC_ENTRY(0x10de0403, &quot;GPU 0403 HDMI/DP&quot;, pat=
ch_nvhdmi)&quot; to
snd_hda_id_hdmi[] (PCI ID of my Nvidia HDA wasn't there) and
&quot;codec-&gt;link_down_at_suspend =3D 1;&quot; to patch_nvhdmi(). With t=
hose changes dGPU
and HDA suspended normally (after echoing &quot;auto&quot; to HDA control f=
ile), so I
think that this is definiteley the right track!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15704706801.0B5d1c.9879--

--===============1058284572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1058284572==--
