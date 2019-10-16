Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C42D9BE3
	for <lists+nouveau@lfdr.de>; Wed, 16 Oct 2019 22:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038E36E9CF;
	Wed, 16 Oct 2019 20:38:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A3EC56E176
 for <nouveau@lists.freedesktop.org>; Wed, 16 Oct 2019 20:38:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9BC5B7296E; Wed, 16 Oct 2019 20:38:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 16 Oct 2019 20:38:54 +0000
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
Message-ID: <bug-75985-8800-Cbjamd39ov@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1384384926=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1384384926==
Content-Type: multipart/alternative; boundary="15712583340.C4e2.2321"
Content-Transfer-Encoding: 7bit


--15712583340.C4e2.2321
Date: Wed, 16 Oct 2019 20:38:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #114 from Lukas Wunner <lukas@wunner.de> ---
(In reply to Przemys=C5=82aw Kopa from comment #113)
> (In reply to Lukas Wunner from comment #112)
> > Glad to hear. You don't seem to have any commits in the kernel so far. =
Would
> > you like to try and bake these changes into a proper patch? If not I'll
> > gladly create and submit the patch myself but mentoring someone else ma=
ke
> > their first contribution is more beneficial to the community, hence my
> > question.
>=20
> Lukas, could you please handle it this time? Sorry for not posting sooner.

Sure thing.

Just one question, you wrote that you had to add "HDA_CODEC_ENTRY(0x10de040=
3,
"GPU 0403 HDMI/DP", patch_nvhdmi)" to snd_hda_id_hdmi[] with the rationale =
that
the "PCI ID of my Nvidia HDA wasn't there".

This confuses me because the PCI device ID of the HDA controller is "0bea" =
and
"0403" are the 16 most significant bits of the PCI class ID.

HDA_CODEC_ENTRY() needs to match for the 32-bit HD audio vendor ID. Just to
double-check, could you execute "cat
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/vendor_id" and post the result
here? Is it really 0x10de0403? Thanks!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15712583340.C4e2.2321
Date: Wed, 16 Oct 2019 20:38:54 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c114">Comme=
nt # 114</a>
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
?id=3D75985#c113">comment #113</a>)
<span class=3D"quote">&gt; (In reply to Lukas Wunner from <a href=3D"show_b=
ug.cgi?id=3D75985#c112">comment #112</a>)
&gt; &gt; Glad to hear. You don't seem to have any commits in the kernel so=
 far. Would
&gt; &gt; you like to try and bake these changes into a proper patch? If no=
t I'll
&gt; &gt; gladly create and submit the patch myself but mentoring someone e=
lse make
&gt; &gt; their first contribution is more beneficial to the community, hen=
ce my
&gt; &gt; question.
&gt;=20
&gt; Lukas, could you please handle it this time? Sorry for not posting soo=
ner.</span >

Sure thing.

Just one question, you wrote that you had to add &quot;HDA_CODEC_ENTRY(0x10=
de0403,
&quot;GPU 0403 HDMI/DP&quot;, patch_nvhdmi)&quot; to snd_hda_id_hdmi[] with=
 the rationale that
the &quot;PCI ID of my Nvidia HDA wasn't there&quot;.

This confuses me because the PCI device ID of the HDA controller is &quot;0=
bea&quot; and
&quot;0403&quot; are the 16 most significant bits of the PCI class ID.

HDA_CODEC_ENTRY() needs to match for the 32-bit HD audio vendor ID. Just to
double-check, could you execute &quot;cat
/sys/bus/pci/devices/0000:01:00.1/hdaudioC1D0/vendor_id&quot; and post the =
result
here? Is it really 0x10de0403? Thanks!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15712583340.C4e2.2321--

--===============1384384926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1384384926==--
