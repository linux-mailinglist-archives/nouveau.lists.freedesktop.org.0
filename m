Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46424CEB88
	for <lists+nouveau@lfdr.de>; Mon,  7 Oct 2019 20:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832196E13A;
	Mon,  7 Oct 2019 18:12:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B293A6E135
 for <nouveau@lists.freedesktop.org>; Mon,  7 Oct 2019 18:12:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AF86F72162; Mon,  7 Oct 2019 18:12:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 07 Oct 2019 18:12:49 +0000
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
Message-ID: <bug-75985-8800-RCoSYUkvSi@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2037584146=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============2037584146==
Content-Type: multipart/alternative; boundary="15704719692.Ce1CEE53.14885"
Content-Transfer-Encoding: 7bit


--15704719692.Ce1CEE53.14885
Date: Mon, 7 Oct 2019 18:12:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #112 from Lukas Wunner <lukas@wunner.de> ---
(In reply to Przemys=C5=82aw Kopa from comment #111)
> (In reply to Lukas Wunner from comment #110)
> > What does "cat /sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/revision_i=
d" say?
> It says: 0x100100
>=20
> > If you add "codec->link_down_at_suspend =3D 1;" to patch_nvhdmi() in
> > sound/pci/hda/patch_hdmi.c, the issue may go away.
> >=20
> > The only question is whether your card's revision_id is listed in
> > snd_hda_id_hdmi[] such that patch_nvhdmi() is executed for your card.
>=20
> I added "HDA_CODEC_ENTRY(0x10de0403, "GPU 0403 HDMI/DP", patch_nvhdmi)" to
> snd_hda_id_hdmi[] (PCI ID of my Nvidia HDA wasn't there) and
> "codec->link_down_at_suspend =3D 1;" to patch_nvhdmi(). With those changes
> dGPU and HDA suspended normally (after echoing "auto" to HDA control file=
),
> so I think that this is definiteley the right track!

Glad to hear. You don't seem to have any commits in the kernel so far. Would
you like to try and bake these changes into a proper patch? If not I'll gla=
dly
create and submit the patch myself but mentoring someone else make their fi=
rst
contribution is more beneficial to the community, hence my question. You co=
uld
attach the patch to this bugzilla and we can provide you with comments befo=
re
you submit it to the list.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15704719692.Ce1CEE53.14885
Date: Mon, 7 Oct 2019 18:12:49 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c112">Comme=
nt # 112</a>
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
?id=3D75985#c111">comment #111</a>)
<span class=3D"quote">&gt; (In reply to Lukas Wunner from <a href=3D"show_b=
ug.cgi?id=3D75985#c110">comment #110</a>)
&gt; &gt; What does &quot;cat /sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0=
/revision_id&quot; say?
&gt; It says: 0x100100
&gt;=20
&gt; &gt; If you add &quot;codec-&gt;link_down_at_suspend =3D 1;&quot; to p=
atch_nvhdmi() in
&gt; &gt; sound/pci/hda/patch_hdmi.c, the issue may go away.
&gt; &gt;=20
&gt; &gt; The only question is whether your card's revision_id is listed in
&gt; &gt; snd_hda_id_hdmi[] such that patch_nvhdmi() is executed for your c=
ard.
&gt;=20
&gt; I added &quot;HDA_CODEC_ENTRY(0x10de0403, &quot;GPU 0403 HDMI/DP&quot;=
, patch_nvhdmi)&quot; to
&gt; snd_hda_id_hdmi[] (PCI ID of my Nvidia HDA wasn't there) and
&gt; &quot;codec-&gt;link_down_at_suspend =3D 1;&quot; to patch_nvhdmi(). W=
ith those changes
&gt; dGPU and HDA suspended normally (after echoing &quot;auto&quot; to HDA=
 control file),
&gt; so I think that this is definiteley the right track!</span >

Glad to hear. You don't seem to have any commits in the kernel so far. Would
you like to try and bake these changes into a proper patch? If not I'll gla=
dly
create and submit the patch myself but mentoring someone else make their fi=
rst
contribution is more beneficial to the community, hence my question. You co=
uld
attach the patch to this bugzilla and we can provide you with comments befo=
re
you submit it to the list.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15704719692.Ce1CEE53.14885--

--===============2037584146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2037584146==--
