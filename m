Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EF3802023
	for <lists+nouveau@lfdr.de>; Sun,  3 Dec 2023 02:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F7810E241;
	Sun,  3 Dec 2023 01:06:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sender4-pp-o90.zoho.com (sender4-pp-o90.zoho.com
 [136.143.188.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B16110E241
 for <nouveau@lists.freedesktop.org>; Sun,  3 Dec 2023 01:05:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1701565526; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LxMc/4RXoIfoCI3tlUiyV7LncWgTp1IosdxataQqIzbHyH1hYqvmr9b9OPjKc0l4Ke2FdtLK+dz/DQuK+Uv962rUd6jHSQhyWg2G02KpjuaHzuxdM8voS5NTTnPMBa+7DpDSOBI1qsCedjHm49yNIvyCFy65HMuLnZYFLpNXuM0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1701565526;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=sPfPysC0/7M3ENTe4yDDIol20npmsmwYA0xega31Jrc=; 
 b=mHw4KzHTv5romJbwGuMMHrFx2uyi9UrATcD+3iR7jz1fBPESDnp5gBN/PopSnBYAG107Njs7lMlG8Eh2pZqoKoQj/V/+dhxTLw7X83nGfqNrlTiQp/BzA8dYshfpAuZI68aBpEJkoH0fMS9clCihsmEm/4ye2/yhIcN/BiOTdzA=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=zoho.com;
 spf=pass  smtp.mailfrom=dufresnep@zoho.com;
 dmarc=pass header.from=<dufresnep@zoho.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1701565526; 
 s=zm2022; d=zoho.com; i=dufresnep@zoho.com;
 h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To:Cc;
 bh=sPfPysC0/7M3ENTe4yDDIol20npmsmwYA0xega31Jrc=;
 b=gzh421Jl2lPrmeZIKVVwYMZodk/Fke/deWD5OEL9uu86t4AbU9z1DyBwbpTd120C
 Zne5AccwXewRU3ktnxzqW9hqPAKjE4OpkGNbEU5VXbDRU/tA/9vVCw1uV16ZMwU0RW/
 AyKqaXWKsE5Rv7HfpN5K2c04XcLYkv0Ae9s7wKvk=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1701565521334887.8574177056457;
 Sat, 2 Dec 2023 17:05:21 -0800 (PST)
Received: from  [66.129.153.16] by mail.zoho.com
 with HTTP;Sat, 2 Dec 2023 17:05:21 -0800 (PST)
Date: Sat, 02 Dec 2023 20:05:21 -0500
From: Paul Dufresne <dufresnep@zoho.com>
To: "nouveau" <nouveau@lists.freedesktop.org>
Message-ID: <18c2d355d9b.876e55a483522.7276101005069044079@zoho.com>
In-Reply-To: <18c2cec3e0b.43c650e278352.9029653729267398761@zoho.com>
References: <18c2c2de15d.455f53a281608.187456526925211202@zoho.com>
 <18c2cec3e0b.43c650e278352.9029653729267398761@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr080112282397213078776390cbb4c5d30000b390848c065aa7229977e1ad50e09962ab4d7abe253a7d48fa84:zu080112271ad81ffbc0b6d0133cfca6680000aafc3a844b4fa03f488aa688256ac3e11d8cab966dfe4fab3e:rf080112321e5e12edccb157b3356a42130000b12393c91fde7b2e9cf7a4364e295ac4ad51bc63ab5188911a916f0277c3fb3c3ccabd52:ZohoMail
Subject: [Nouveau] =?utf-8?b?UsOpwqA6IFLDqcKgOiBIb3cgdG8gc2V0IGRlYnVnIHBh?=
 =?utf-8?q?rameters_to_get_the_information_I_want=3F?=
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

---- Le sam., 02 d=C3=A9c. 2023 18:45:29 -0500 Paul Dufresne  a =C3=A9crit =
----
 > Now need to work on removing also the:=20
 > [  339.029792] nouveau 0000:01:00.0: therm: FAN target request: 31%=20
 > [  339.029805] nouveau 0000:01:00.0: therm: FAN target: 31=20
 > [  339.029816] nouveau 0000:01:00.0: therm: FAN update: 31=20
=20
It seems I managed to fix that too.

Sorry for not using git... I'll probably ask some info about that in an oth=
er thread.

paul@albukerk:~/linux/linux-6.7-rc3$ diff -u drivers/gpu/drm/nouveau/nvkm/s=
ubdev/therm/base.c.orig drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
--- drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c.orig=092023-12-02 19:1=
4:05.222432618 -0500
+++ drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c=092023-12-02 19:16:21.=
186420606 -0500
@@ -155,7 +155,7 @@
 =09spin_unlock_irqrestore(&therm->lock, flags);
=20
 =09if (duty >=3D 0) {
-=09=09nvkm_debug(subdev, "FAN target request: %d%%\n", duty);
+=09=09nvkm_trace(subdev, "FAN target request: %d%%\n", duty);
 =09=09nvkm_therm_fan_set(therm, immd, duty);
 =09}
 }
paul@albukerk:~/linux/linux-6.7-rc

paul@albukerk:~/linux/linux-6.7-rc3$ diff -u drivers/gpu/drm/nouveau/nvkm/s=
ubdev/therm/fan.c.orig drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c
--- drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c.orig=092023-12-02 19:14=
:11.070432113 -0500
+++ drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c=092023-12-02 19:15:43.9=
18423954 -0500
@@ -45,7 +45,7 @@
 =09target =3D max_t(u8, target, fan->bios.min_duty);
 =09target =3D min_t(u8, target, fan->bios.max_duty);
 =09if (fan->percent !=3D target) {
-=09=09nvkm_debug(subdev, "FAN target: %d\n", target);
+=09=09nvkm_trace(subdev, "FAN target: %d\n", target);
 =09=09fan->percent =3D target;
 =09}
=20
@@ -70,7 +70,7 @@
 =09=09duty =3D target;
 =09}
=20
-=09nvkm_debug(subdev, "FAN update: %d\n", duty);
+=09nvkm_trace(subdev, "FAN update: %d\n", duty);
 =09ret =3D fan->set(therm, duty);
 =09if (ret) {
 =09=09spin_unlock_irqrestore(&fan->lock, flags);
paul@albukerk:~/linux/linux-6.7-rc3$=20

With that, nouveau.debug=3Ddebug seems to not grow "for no reason" anymore!
Tested only with no monitor connected to the nvidia card yet. (connected to=
 i915 VGA motherboard)...
but previously was having the FAN messages.

