Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D30114966B
	for <lists+nouveau@lfdr.de>; Tue, 18 Jun 2019 02:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0316E0BF;
	Tue, 18 Jun 2019 00:48:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C318D6E0C1
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2019 00:48:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C00C372167; Tue, 18 Jun 2019 00:48:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 18 Jun 2019 00:48:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: taranov.andrey@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110931-8800-Hb2kMsr00N@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110931-8800@http.bugs.freedesktop.org/>
References: <bug-110931-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110931] Timeout initializing Falcon after cold boot
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
Content-Type: multipart/mixed; boundary="===============0594021460=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0594021460==
Content-Type: multipart/alternative; boundary="15608189242.dD400Ec1d.20806"
Content-Transfer-Encoding: 7bit


--15608189242.dD400Ec1d.20806
Date: Tue, 18 Jun 2019 00:48:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110931

--- Comment #5 from Andrey Taranov <taranov.andrey@gmail.com> ---
Created attachment 144584
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144584&action=3Dedit
VBIOS

Produced with
# cp /sys/kernel/debug/dri/1/vbios.rom .

In my case, it is dri/1:
# cat /sys/kernel/debug/dri/1/name
nouveau dev=3D0000:01:00.0 master=3Dpci:0000:01:00.0 unique=3D0000:01:00.0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15608189242.dD400Ec1d.20806
Date: Tue, 18 Jun 2019 00:48:44 +0000
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
   title=3D"NEW - Timeout initializing Falcon after cold boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110931#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Timeout initializing Falcon after cold boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110931">bug 11093=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
taranov.andrey&#64;gmail.com" title=3D"Andrey Taranov &lt;taranov.andrey&#6=
4;gmail.com&gt;"> <span class=3D"fn">Andrey Taranov</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144584=
" name=3D"attach_144584" title=3D"VBIOS">attachment 144584</a> <a href=3D"a=
ttachment.cgi?id=3D144584&amp;action=3Dedit" title=3D"VBIOS">[details]</a><=
/span>
VBIOS

Produced with
# cp /sys/kernel/debug/dri/1/vbios.rom .

In my case, it is dri/1:
# cat /sys/kernel/debug/dri/1/name
nouveau dev=3D0000:01:00.0 master=3Dpci:0000:01:00.0 unique=3D0000:01:00.0<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15608189242.dD400Ec1d.20806--

--===============0594021460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0594021460==--
