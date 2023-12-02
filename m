Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E6C801FBF
	for <lists+nouveau@lfdr.de>; Sun,  3 Dec 2023 00:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC87D10E0A0;
	Sat,  2 Dec 2023 23:46:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sender4-pp-o90.zoho.com (sender4-pp-o90.zoho.com
 [136.143.188.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509F410E0A0
 for <nouveau@lists.freedesktop.org>; Sat,  2 Dec 2023 23:45:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1701560737; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UTELOHAwW49Wl1kn/xK/HODchrC5hUu1VUJ5yQl6tFXNWL/cpS7WBb0SPOHVkP/1VTWOcpu+N5a4MbzMTJ4gl0Go/Q/wWdp/EyJHYfbrFMsFO63MNTjdHEuUYJ/9yi05XFP/GZWtFAt3LiLj5I0D4a9ItHSfT9VPI5DRoio5u74=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1701560737;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=tbBkZRLiY5IAJYWWBRh9m8gnuq9kjQCymuPVsm1qcfQ=; 
 b=VXhi9VMUswOCCGvvWnnk61/wNmPlENsR10n4QVaLLuhAFOP+JG/eykePa9jnTox4CNr9kVGkfiLOAECEyl20FYv9rAADcQU60W9Z49IIJcMGBHbK36bVoEj9hHiwoR18MShE8t4k2rbkjMc389EiaQ0Rx/dpr/AFoovoK7LKJ2w=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=zoho.com;
 spf=pass  smtp.mailfrom=dufresnep@zoho.com;
 dmarc=pass header.from=<dufresnep@zoho.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1701560737; 
 s=zm2022; d=zoho.com; i=dufresnep@zoho.com;
 h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To:Cc;
 bh=tbBkZRLiY5IAJYWWBRh9m8gnuq9kjQCymuPVsm1qcfQ=;
 b=R9EzCLu1iHWO+76xuW9UH++t5eEvM+qc7PbiYYxBEmSdNCJlpN+cbRo4KHFRp8Qe
 tpM7rqQapXMcbVyxYv8LKJvFK7hN61g7f3ELlj5QI36CwLHfJN0CtUtVKOeA/4enDe3
 hJp4DgGXro7RP+pzWM8evsM549kHHBMQ6dRBoIAc=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 170156072911658.777900921969945;
 Sat, 2 Dec 2023 15:45:29 -0800 (PST)
Received: from  [66.129.153.16] by mail.zoho.com
 with HTTP;Sat, 2 Dec 2023 15:45:29 -0800 (PST)
Date: Sat, 02 Dec 2023 18:45:29 -0500
From: Paul Dufresne <dufresnep@zoho.com>
To: "nouveau" <nouveau@lists.freedesktop.org>
Message-ID: <18c2cec3e0b.43c650e278352.9029653729267398761@zoho.com>
In-Reply-To: <18c2c2de15d.455f53a281608.187456526925211202@zoho.com>
References: <18c2c2de15d.455f53a281608.187456526925211202@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr080112288c48eabb85b077388d17f91400000e79db921b9d7a8427ea149790460e1fded4fb24944fe4545501:zu08011227907296cf4c934bba28ad42a30000bab530c6e475bc258ec8e84d8c417882448e03b10ff417f212:rf0801123238a42d9876ca4e65b4d025680000cc198ba835e82268a319f5a625b5125b012cf411ff5bfe0797518af240deccc68520e824:ZohoMail
Subject: [Nouveau] =?utf-8?q?R=C3=A9=C2=A0=3A_How_to_set_debug_parameters?=
 =?utf-8?q?_to_get_the_information_I_want=3F?=
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

Seems I have been able to push:
unneeded info looks like this: 
[  338.951804] nouveau: DRM-master:00000000:8000900b: fini completed in 7us 
[  338.951811] nouveau: DRM-master:00000000:8000900b: destroy children... 
[  338.951818] nouveau: DRM-master:00000000:8000900b: destroy running... 
[  338.951825] nouveau: DRM-master:00000000:8000900b: destroy completed in 6us... 
[  338.954303] nouveau: DRM-master:00000000:8000900b: init running...
to trace level... making nouveau.debug=debug more clear.

I have found the macros that do these messages in drivers/gpu/drm/nouveau/include/nvkm/core/client.h :
/* logging for client-facing objects */
#define nvif_printk(o,l,p,f,a...) do {                                         \
	const struct nvkm_object *_object = (o);                               \
	const struct nvkm_client *_client = _object->client;                   \
	if (_client->debug >= NV_DBG_##l)                                      \
		printk(KERN_##p "nouveau: %s:%08x:%08x: "f, _client->name,     \
		       _object->handle, _object->oclass, ##a);                 \
} while(0)
#define nvif_fatal(o,f,a...) nvif_printk((o), FATAL, CRIT, f, ##a)
#define nvif_error(o,f,a...) nvif_printk((o), ERROR,  ERR, f, ##a)
#define nvif_debug(o,f,a...) nvif_printk((o), DEBUG, INFO, f, ##a)
#define nvif_trace(o,f,a...) nvif_printk((o), TRACE, INFO, f, ##a)
#define nvif_info(o,f,a...)  nvif_printk((o),  INFO, INFO, f, ##a)
#define nvif_ioctl(o,f,a...) nvif_trace((o), "ioctl: "f, ##a)
#endif

So all I done was:
sed -i 's/nvif_debug/nvif_trace/g' drivers/gpu/drm/nouveau/nvkm/core/object.c

resulting in a "patch":
paul@albukerk:~/linux/linux-6.7-rc3$ diff -u drivers/gpu/drm/nouveau/nvkm/core/object.c.orig drivers/gpu/drm/nouveau/nvkm/core/object.c
--- drivers/gpu/drm/nouveau/nvkm/core/object.c.orig	2023-12-02 17:47:01.298989857 -0500
+++ drivers/gpu/drm/nouveau/nvkm/core/object.c	2023-12-02 17:48:32.814997742 -0500
@@ -183,7 +183,7 @@
 	s64 time;
 	int ret;
 
-	nvif_debug(object, "%s children...\n", action);
+	nvif_trace(object, "%s children...\n", action);
 	time = ktime_to_us(ktime_get());
 	list_for_each_entry_reverse(child, &object->tree, head) {
 		ret = nvkm_object_fini(child, suspend);
@@ -191,7 +191,7 @@
 			goto fail_child;
 	}
 
-	nvif_debug(object, "%s running...\n", action);
+	nvif_trace(object, "%s running...\n", action);
 	if (object->func->fini) {
 		ret = object->func->fini(object, suspend);
 		if (ret) {
@@ -202,7 +202,7 @@
 	}
 
 	time = ktime_to_us(ktime_get()) - time;
-	nvif_debug(object, "%s completed in %lldus\n", action, time);
+	nvif_trace(object, "%s completed in %lldus\n", action, time);
 	return 0;
 
 fail:
@@ -225,7 +225,7 @@
 	s64 time;
 	int ret;
 
-	nvif_debug(object, "init running...\n");
+	nvif_trace(object, "init running...\n");
 	time = ktime_to_us(ktime_get());
 	if (object->func->init) {
 		ret = object->func->init(object);
@@ -233,7 +233,7 @@
 			goto fail;
 	}
 
-	nvif_debug(object, "init children...\n");
+	nvif_trace(object, "init children...\n");
 	list_for_each_entry(child, &object->tree, head) {
 		ret = nvkm_object_init(child);
 		if (ret)
@@ -241,7 +241,7 @@
 	}
 
 	time = ktime_to_us(ktime_get()) - time;
-	nvif_debug(object, "init completed in %lldus\n", time);
+	nvif_trace(object, "init completed in %lldus\n", time);
 	return 0;
 
 fail_child:
@@ -261,19 +261,19 @@
 	void *data = object;
 	s64 time;
 
-	nvif_debug(object, "destroy children...\n");
+	nvif_trace(object, "destroy children...\n");
 	time = ktime_to_us(ktime_get());
 	list_for_each_entry_safe(child, ctemp, &object->tree, head) {
 		nvkm_object_del(&child);
 	}
 
-	nvif_debug(object, "destroy running...\n");
+	nvif_trace(object, "destroy running...\n");
 	nvkm_object_unmap(object);
 	if (object->func->dtor)
 		data = object->func->dtor(object);
 	nvkm_engine_unref(&object->engine);
 	time = ktime_to_us(ktime_get()) - time;
-	nvif_debug(object, "destroy completed in %lldus...\n", time);
+	nvif_trace(object, "destroy completed in %lldus...\n", time);
 	return data;
 }
 
paul@albukerk:~/linux/linux-6.7-rc3$ 

Now need to work on removing also the:
[  339.029792] nouveau 0000:01:00.0: therm: FAN target request: 31%
[  339.029805] nouveau 0000:01:00.0: therm: FAN target: 31
[  339.029816] nouveau 0000:01:00.0: therm: FAN update: 31
