Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 582807B2E1C
	for <lists+nouveau@lfdr.de>; Fri, 29 Sep 2023 10:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3504C10E6E3;
	Fri, 29 Sep 2023 08:42:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41F810E58D
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 21:30:39 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-58cb845f2f2so18879487b3.1
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 14:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1694727039; x=1695331839;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tHD/q/SJLFYWSfqzhKThHqH+If9tHeimdGSeLbCxs0o=;
 b=fx8mvjfTB46z3jybINWn4SufMmEgQk627PfVB9d08qh6BN2wydXlK3NH2coaJwixIQ
 tDSr2uZwCRmBXYAFB6c8dfObMe288gfdN6rWsI4Y7ladMHkLDDcy2q/V+XjijPSWfIbG
 izFqpxIKgZjMOfM+h33cGZrpEUl4Nt/PFUw4VaebX+FImssNM7UR2tR4O6t0BjCyJKgr
 zLDAluUPc7FgjGyqCaeO7GxyQBIrEJhS4qinrlbf2/zJR2KKq1S850Ea6zPXzHb2Y19i
 O2cEvWsaWnKIJV1DDUNHKC90UIP6AIQvPwRFUkyLakk1zr//DXyQdOMa0TIgracltmIW
 8iOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694727039; x=1695331839;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tHD/q/SJLFYWSfqzhKThHqH+If9tHeimdGSeLbCxs0o=;
 b=KCXTCdHu+pRU4RKmTd/vszqBr8HXJjHTyALZNhQw7+qcY2PnQliFG3Pnq7/ajSYHc0
 rjVZibOI0VarbN13M73l/B/vhrpxbQFwd/bplTRce+lUJtI0qCpMLxgb1lZJJ+b1ZxLl
 pO8T6i2TA17dTyvOJonCup1ce+WnBSkCPM5KtArjpdrpO76mt/eGgfbjN+f0ZMmwUpZn
 TbXaKUEhrI/YUCpRZoq8utIXqgwjcWw6EWfZjtvG/VCdubEQ8pGu6g6fD/hVvqAPW8LL
 EDOodRU7DOBptFnkSZ2qAe00rVqrMuYS/zxOwUSbUtYAtbJ8WQraoKVwg3nkBhvAR6Tk
 xqVA==
X-Gm-Message-State: AOJu0YwvO4UOMzG8rapVXkpA23rW8n8ZI4MhjilVPnbELVkpmqE7x/gz
 nm+XgmJd7ClnWJiL4o3h3nkOEtgfWX0+NvB1YA==
X-Google-Smtp-Source: AGHT+IGX8yvrtUoKVn7mJlx7ANqKychzQ3OooCdQznWtzGJrkQcp6QG1fyYuUP8f+T6DjKoeAxURtoAR54eD/SD2gQ==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:450c:0:b0:586:a8ab:f8fe with SMTP
 id s12-20020a81450c000000b00586a8abf8femr176035ywa.10.1694727038901; Thu, 14
 Sep 2023 14:30:38 -0700 (PDT)
Date: Thu, 14 Sep 2023 21:30:37 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHx7A2UC/x2NQQ6CQAxFr0K6tgnMqBGvYlxgKdhEy6RlJhrC3
 Z24e2/x/t/A2YQdrs0GxkVcFq3SHRqg56Azo4zVIbQhtn13RF9NKX1xNClsjnPKld+oSy48ZNQ
 iE9JLWFckvIRHDSme+1OEupmMJ/n8/273ff8B4I28qX8AAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694727038; l=1659;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=Q5CFsZyxCfw6hgNgrBpo5UsVYRuZcWL5zSBOa/5AHCg=;
 b=J+RLdusJNzQ1fs2a8n+U6McsahNsvZ0DMJXnqsKtVDvGrjExGw+WOkTee3/eBqCw8pmFfoQkt
 3+dBjHWINIqCOHsLbFQ4KpmqaC+OrdCs40Utc/nsxWtXyWMQ05+y3O9
X-Mailer: b4 0.12.3
Message-ID: <20230914-strncpy-drivers-gpu-drm-nouveau-nvif-client-c-v1-1-dc3b3719fcb4@google.com>
From: Justin Stitt <justinstitt@google.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Fri, 29 Sep 2023 08:42:15 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/nvif: refactor deprecated strncpy
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
Cc: nouveau@lists.freedesktop.org, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

`strncpy` is deprecated and as such we should prefer more robust and
less ambiguous string interfaces.

A suitable replacement is `strscpy_pad` due to the fact that it
guarantees NUL-termination on the destination buffer whilst also
maintaining the NUL-padding behavior that `strncpy` provides. I am not
sure whether NUL-padding is strictly needed but I see in
`nvif_object_ctor()` args is memcpy'd elsewhere so I figured we'd keep
the same functionality.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.
---
 drivers/gpu/drm/nouveau/nvif/client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
index a3264a0e933a..3a27245f467f 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -69,7 +69,7 @@ nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
 	} nop = {};
 	int ret;
 
-	strncpy(args.name, name, sizeof(args.name));
+	strscpy_pad(args.name, name, sizeof(args.name));
 	ret = nvif_object_ctor(parent != client ? &parent->object : NULL,
 			       name ? name : "nvifClient", 0,
 			       NVIF_CLASS_CLIENT, &args, sizeof(args),

---
base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
change-id: 20230914-strncpy-drivers-gpu-drm-nouveau-nvif-client-c-82b023c36953

Best regards,
--
Justin Stitt <justinstitt@google.com>

