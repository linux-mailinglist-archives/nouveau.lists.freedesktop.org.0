Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464CE98F5C
	for <lists+nouveau@lfdr.de>; Thu, 22 Aug 2019 11:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7BD6EADB;
	Thu, 22 Aug 2019 09:30:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 51D246EAD8
 for <nouveau@lists.freedesktop.org>; Thu, 22 Aug 2019 09:30:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4EC1D72161; Thu, 22 Aug 2019 09:30:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Thu, 22 Aug 2019 09:30:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: morpheus2051@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111463-8800-IuGPKmx5tF@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111463-8800@http.bugs.freedesktop.org/>
References: <bug-111463-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 111463] [NV49] MMIO write FAULT at 00c200
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
Content-Type: multipart/mixed; boundary="===============1164236358=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============1164236358==
Content-Type: multipart/alternative; boundary="15664662501.CA1FF21.31006"
Content-Transfer-Encoding: 7bit


--15664662501.CA1FF21.31006
Date: Thu, 22 Aug 2019 09:30:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111463

--- Comment #1 from Matthias <morpheus2051@web.de> ---
Created attachment 145129
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145129&action=3Dedit
dmesg after lockup

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15664662501.CA1FF21.31006
Date: Thu, 22 Aug 2019 09:30:50 +0000
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
   title=3D"NEW - [NV49] MMIO write FAULT at 00c200"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111463#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV49] MMIO write FAULT at 00c200"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111463">bug 11146=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
morpheus2051&#64;web.de" title=3D"Matthias &lt;morpheus2051&#64;web.de&gt;"=
> <span class=3D"fn">Matthias</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145129=
" name=3D"attach_145129" title=3D"dmesg after lockup">attachment 145129</a>=
 <a href=3D"attachment.cgi?id=3D145129&amp;action=3Dedit" title=3D"dmesg af=
ter lockup">[details]</a></span>
dmesg after lockup</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15664662501.CA1FF21.31006--

--===============1164236358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1164236358==--
