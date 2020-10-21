Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53CD29524D
	for <lists+nouveau@lfdr.de>; Wed, 21 Oct 2020 20:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8DC6EE72;
	Wed, 21 Oct 2020 18:33:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8882D6EE72
 for <nouveau@lists.freedesktop.org>; Wed, 21 Oct 2020 18:33:58 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id h6so4401894lfj.3
 for <nouveau@lists.freedesktop.org>; Wed, 21 Oct 2020 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:user-agent:mime-version:message-id;
 bh=IITF7kIU3mcojpt7zQe0XQTfglxzvVT4u7wXZtbrLy4=;
 b=Sc6+I+R/wEh3ZkCV8DO2VqkcK/6e6fvlT7awX9t0Qgb+QZhYeg+nB1+jdGja+PZxO3
 6rUQsSiz/iV3N1P6gMiDjXQIxqQb7SreKm8/HK/lH1kx0ArFtivCg7sEVL49VnUjgzJK
 Ex+rIYa83n2/DmITj9n57AkM4znExBSh1Qp0Istf+5vZlNm5NufTDn7Km1dC8mWKs4C+
 xisiLoiOhgKNQ3+1WMyzHZMIz3XEB6PfFFsM54kqfIsvwi/J4SgOqGQURBZakEn96hzm
 NE/GgeuMa5gS5w/rAUH9YRjfU7OoeSw7dqi5OqszglBBTagsm6K6biBYTpRox8ofY+0G
 8JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:user-agent:mime-version
 :message-id;
 bh=IITF7kIU3mcojpt7zQe0XQTfglxzvVT4u7wXZtbrLy4=;
 b=g9SkCkhMxMA4OZIDbPTilQub46+rbXgxkYT6QFfTT+cMjTz+KNaHo9Jcrlzh6BVsY3
 3eKBQ+Tv79wpz30xdNO5MUeHPUrel5IzuhxYT0EpcpkAwuIjInBasPJmPU7BLPqhzS1R
 LWebPWUT4QRcnIoGFa0b0yKD3ZCW2Z9xtjL6m0J/4qZVwJObYXF3094KjXSrQGJt5HOT
 bhXj5Rc9rcUFog39XrjIVcLO8J7fL1zRTbpHHrJwARH4HU8H3jRHAJtnEtG7JrHxGCoR
 QAbIfDUruo41nlpY7euAd2zgNBwkTDOGRZFIkU+bydHz9CE9pBx6BVcJC1azXzekuXcC
 KYpA==
X-Gm-Message-State: AOAM530kB0zHAYThDbDSSjwF4ATv69yDtn9WWICdKwHSuqzxNSmDh8FU
 vwGYWZfqrpaifjp1Jp60eSp8OMH4QxHxAg==
X-Google-Smtp-Source: ABdhPJyu5dsQ0p/POTFeUwU8K8buCfq7BbgIbUyQwB6HLKUyL72Vqba+8P7kLRG1ico5q8tmHjBFVQ==
X-Received: by 2002:a19:e04e:: with SMTP id g14mr1590559lfj.590.1603305236616; 
 Wed, 21 Oct 2020 11:33:56 -0700 (PDT)
Received: from [192.168.1.100] ([176.116.252.109])
 by smtp.gmail.com with ESMTPSA id i185sm523082lfi.230.2020.10.21.11.33.55
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Oct 2020 11:33:55 -0700 (PDT)
From: Andrew Randrianasulu <randrianasulu@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Wed, 21 Oct 2020 21:20:24 +0300
User-Agent: KMail/1.9.10
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_pvHkfksRZ1l/Ncf"
Message-Id: <202010212120.25137.randrianasulu@gmail.com>
Subject: [Nouveau] Kill some nvc0 defines from nv50_ir_target_nv50.h
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

--Boundary-00=_pvHkfksRZ1l/Ncf
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Well, as Illia Mirkin suggested I killed few lines of code :}

Driver seems to compile fine afterwards, and run glxgeras :}
and clpeak too (but with external nv50 compute patches from Pierre Moreau)

=46rom 528143b24875e8053edfb95cfc97fe0ac7fa9ebb Mon Sep 17 00:00:00 2001
=46rom: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Wed, 21 Oct 2020 21:14:24 +0300
Subject: [PATCH] Nuke NVC0 defines from nouveau/codegen/nv50_ir_target_nv50=
=2Eh
 (they are in nouveau/codegen/nv50_ir_target_nvc0.h)

=2D--
 src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h b/sr=
c/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h
index caf66b269db..604a35890b7 100644
=2D-- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h
@@ -24,12 +24,6 @@

 namespace nv50_ir {

=2D#define NVC0_BUILTIN_DIV_U32 0
=2D#define NVC0_BUILTIN_DIV_S32 1
=2D#define NVC0_BUILTIN_RCP_F64 2
=2D#define NVC0_BUILTIN_RSQ_F64 3
=2D
=2D#define NVC0_BUILTIN_COUNT 4

 class TargetNV50 : public Target
 {
=2D-
2.14.5

--Boundary-00=_pvHkfksRZ1l/Ncf
Content-Type: text/x-diff;
  charset="iso 8859-1";
  name="0001-Nuke-NVC0-defines-from-nouveau-codegen-nv50_ir_targe.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-Nuke-NVC0-defines-from-nouveau-codegen-nv50_ir_targe.patch"

=46rom 528143b24875e8053edfb95cfc97fe0ac7fa9ebb Mon Sep 17 00:00:00 2001
=46rom: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Wed, 21 Oct 2020 21:14:24 +0300
Subject: [PATCH] Nuke NVC0 defines from nouveau/codegen/nv50_ir_target_nv50=
=2Eh
 (they are in nouveau/codegen/nv50_ir_target_nvc0.h)

=2D--
 src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h b/sr=
c/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h
index caf66b269db..604a35890b7 100644
=2D-- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h
@@ -24,12 +24,6 @@
=20
 namespace nv50_ir {
=20
=2D#define NVC0_BUILTIN_DIV_U32 0
=2D#define NVC0_BUILTIN_DIV_S32 1
=2D#define NVC0_BUILTIN_RCP_F64 2
=2D#define NVC0_BUILTIN_RSQ_F64 3
=2D
=2D#define NVC0_BUILTIN_COUNT 4
=20
 class TargetNV50 : public Target
 {
=2D-=20
2.14.5


--Boundary-00=_pvHkfksRZ1l/Ncf
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--Boundary-00=_pvHkfksRZ1l/Ncf--
