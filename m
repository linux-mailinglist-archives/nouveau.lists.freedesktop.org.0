Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F19CBAC3D
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0458310EB39;
	Sat, 13 Dec 2025 12:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=arcor.de header.i=@arcor.de header.b="Qbev5wqn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 394 seconds by postgrey-1.36 at gabe;
 Fri, 13 Dec 2024 19:41:00 UTC
Received: from mr4.vodafonemail.de (mr4.vodafonemail.de [145.253.228.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD2910E14A
 for <nouveau@lists.freedesktop.org>; Fri, 13 Dec 2024 19:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
 s=vfde-mb-mr2-23sep; t=1734118464;
 bh=Cbojj2msh79McM8WSuCkjt0iBOIhHH5h1llmgMSsx/U=;
 h=From:To:Message-ID:Date:Subject:Content-type:From;
 b=Qbev5wqnHkmqvEXeY2DtIY+s96H4itzrEgHWl+53ZRa7b039NzxT0yVFlZWJ2/Ce3
 vZ0/x3HL355xEhqoTuQcawxW9bMiz/nFal69INoCFRRN/6Sw6GuPw2jVCCzO5SbLJ3
 wBREGQ2CaA2jf0EaCgxtnzFk4l5rII2t1BzmPBm8=
Received: from mp101.fra-mediabeam.com (unknown [10.0.0.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mr4.vodafonemail.de (Postfix) with ESMTPS id 4Y90003w9xz1y3b
 for <nouveau@lists.freedesktop.org>; Fri, 13 Dec 2024 19:34:24 +0000 (UTC)
Received: from mailbackend01 (unknown [10.0.0.2])
 by mp101.fra-mediabeam.com (Postfix) with ESMTP id 4Y90002Q8pz30WV
 for <nouveau@lists.freedesktop.org>; Fri, 13 Dec 2024 19:34:24 +0000 (UTC)
Received: from [37.201.196.191]
 by mail.vodafone.de via HTTP; Fri, 13 Dec 2024 20:34:20 +0100
From: teppin88@arcor.de
To: nouveau@lists.freedesktop.org
Message-ID: <e65fd7c84642449f9210b3b1abf3b8bb@arcor.de>
Date: Fri, 13 Dec 2024 20:34:20 +0100
X-Priority: 3
Subject: Nouveau driver bug
MIME-Version: 1.0
Content-type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 1901
X-purgate-ID: 155817::1734118464-B0F7C11D-C10655FB/0/0
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:44 +0000
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

<html><head></head><body><div style=3D"font-family: arial,helvetica,san=
s-serif; font-size: 12px;"><title></title>Hello,<br><br>I'm experiencin=
g graphical issues on my Kubuntu 24=2E04=2E1 LTS since early november 2=
024 after upgrading from Kubuntu 22=2E04 LTS which functioned without p=
roblems=2E The graphical shell crashes and freezes in certain situation=
s, now in x11 and Wayland, both of them=2E I have already done a bug re=
port: https://gitlab=2Efreedesktop=2Eorg/drm/nouveau/-/issues/395<br>Th=
e night-color problem in x11 seems to be solved - I uninstalled gammast=
ep indicator=2E I didn't notice that it was installed on my system, bec=
ause it wasn't displayed=2E It was only when I updated my system two da=
ys ago that it suddenly appeared as an installed program=2E<br>I would =
like to continue using the system, but it is still almost unusable and =
it is very annoying, everytime my desktop is freezing and crashing=2E T=
here is no communication after I reported this as a bug, so I don't kno=
w, if there is someone already working on debugging it or if there will=
 be a solution at all=2E I don't know what to do=2E And I also don't wa=
nt to compel a solution from you here and now, but is there something I=
 can do and what could help you more in finding the problem or what cou=
ld speed up the whole process of finding the bug? I'm willing to do wha=
tever could help you with troubleshooting=2E Do you need additional spe=
cific informations about my system? Should I test something on my syste=
m? Do you need a more specific description of the problem?<br>I'm just =
asking if it is possible to communicate about this and to get a respons=
e at all, because I'm some kind of "hanging in limbo" concerning this p=
roblem, if you take my meaning=2E<br><br><br>Many thanks in advance and=
 best regards,<br><br>Kevin</div></body></html>

