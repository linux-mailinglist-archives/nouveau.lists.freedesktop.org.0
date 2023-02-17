Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED569ACC7
	for <lists+nouveau@lfdr.de>; Fri, 17 Feb 2023 14:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF74810EFE0;
	Fri, 17 Feb 2023 13:44:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675D410EFE9
 for <nouveau@lists.freedesktop.org>; Fri, 17 Feb 2023 13:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7uKZrgGFJpURUNNqYPRQvVp3RBdWsUReZR9Qa+W+o5s=;
 b=VgF1xCMRViNC5MoMXSeppypDYZslYo6iwTqkrAGW/CKURrRaWaH2oBB8ghQnQa96PFRRQt
 l8mndVHpU4WyuW4Tuntk2qgDBEn1uSvp/jC95zpheDdx7iUMCn6VmfWgDbQGyNp5d/QnTh
 jdV6Vd6DuDgjwm6fxcMe9ljdF7rNCfY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-192-2d3QBqIHMyWEGyLBThoeAA-1; Fri, 17 Feb 2023 08:44:38 -0500
X-MC-Unique: 2d3QBqIHMyWEGyLBThoeAA-1
Received: by mail-ed1-f72.google.com with SMTP id
 ec16-20020a0564020d5000b004ad51f8fc36so1482220edb.22
 for <nouveau@lists.freedesktop.org>; Fri, 17 Feb 2023 05:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7uKZrgGFJpURUNNqYPRQvVp3RBdWsUReZR9Qa+W+o5s=;
 b=1VeYz2nG2GLOoLZMrHcfJ3HY9aJ6fvDb04N9QLXUdUepINjVQDqJgtOiPE+v5tlO7U
 ixmNB6ZzzspI2jyP8BfhjU7RWYZxAkQe8IP88WMPFB3+q/K565imDu+vkVkMVl7GAW2k
 BEUqj+Y1xMl2FoOd0w9cXGmLFSFDRWPrJHBBMjOuH9C8iDA6myIF8a/pxzKa0ZBj45Lg
 zonyphAmh4gEZdyE73l26iKxxw7jCgkntPRnLbAp2bO+PA4JgJJ38UO5udgR1xOPuv4y
 tJO2zzdSTwIoPfTdmRazS/KEWcnNSdek7ftG9SbKksCW4ncwliQHQf/VXJcjrQ9ce473
 UA9g==
X-Gm-Message-State: AO0yUKVPGnsthox+TvmQtjOm6/f8I+8OeReEeNIa6dpfGIfSxoK81ANA
 USV+frvQeI28+ENsZPNupfHNUlR2caBC3KIw7darsHj3ynayyx6/kk2t3TiDHHTgC6VHsiHAyxB
 1Ip1Lvn1EHWiB6B2z2GHiOxGXrA==
X-Received: by 2002:aa7:c9c6:0:b0:4ae:e51e:9e3e with SMTP id
 i6-20020aa7c9c6000000b004aee51e9e3emr348782edt.24.1676641477312; 
 Fri, 17 Feb 2023 05:44:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9IRUJksGLLW/RDiXSfuPpHSO6kl3p0Lri0OcDeobF/5J+q0ZakgTJZKlO0HFr6pr+zDCdPAg==
X-Received: by 2002:aa7:c9c6:0:b0:4ae:e51e:9e3e with SMTP id
 i6-20020aa7c9c6000000b004aee51e9e3emr348775edt.24.1676641477173; 
 Fri, 17 Feb 2023 05:44:37 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a509508000000b004ad61135698sm1948004eda.13.2023.02.17.05.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:44:36 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Fri, 17 Feb 2023 14:44:08 +0100
Message-Id: <20230217134422.14116-3-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v2 02/16] drm/exec: fix memory leak in
 drm_exec_prepare_obj()
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Don't call drm_gem_object_get() unconditionally.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_exec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index ed2106c22786..5713a589a6a3 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -282,7 +282,6 @@ int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
 			goto error_unlock;
 	}
 
-	drm_gem_object_get(obj);
 	return 0;
 
 error_unlock:
-- 
2.39.1

