Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1236713A4
	for <lists+nouveau@lfdr.de>; Wed, 18 Jan 2023 07:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FD210E69F;
	Wed, 18 Jan 2023 06:14:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A356E10E697
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 06:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674022442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GqctRI7P01D+Q/Vr3L/m1m3KsR2bbveGpuxATunwrRo=;
 b=R3rh6ExMwoJ643qNsF1OtalsQH5Gcn/x3RQbMJnKjUKtYJHNNHGPlqeeWR1FOfA2j89HFw
 GGKIZ7qK/tmHTORoYM8IBlKftkD7fuBP36Mkq+sTZJtAHlN2jkryMc0QKTW17Qn+F6AZbs
 9NnPLCkSomzScPwkNvOnrUaj2yUWgHE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-320-X4G6i5b9M--adONUGnYEbQ-1; Wed, 18 Jan 2023 01:13:54 -0500
X-MC-Unique: X4G6i5b9M--adONUGnYEbQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 sh37-20020a1709076ea500b0087760a6acceso144020ejc.17
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jan 2023 22:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GqctRI7P01D+Q/Vr3L/m1m3KsR2bbveGpuxATunwrRo=;
 b=ojuqtBN7WGk1lR33eA1AGxUN8fXA8Y64z4odLNzIpyJQXeNncTQ/kB0K4af37lPCHz
 slhi1hpznFp9O8jynzAvpvkxXTivzAapzAmvhM32bZqSuVa4V42mr0XamVgdS0XFBcDK
 qxUvVtUQ+KOtb3LGwxLx4XfIUd9T8Vb/o/gLVDk+JupbklYTrJjk8MvjcO221fsReX01
 imZimPWkO3lmmk8QIXXMqCHGlFGI58MWSZZsfm9SlzUEAVRhp9IuDkdMmDlEXlncCnUg
 +Z+4NTkd+/rGq95yjAeurUuPmKlzw5338LhC6bsNbPjMjZcSCGDiB6nDwRE+mH00JUYJ
 sSMg==
X-Gm-Message-State: AFqh2krY0VVT0Z8cynYNL3KLKzjSQL4Xu7nJetfubG/pUOgPbvADTUev
 nrx+2kFvYJaUUKDtbseu2Q0rk+aG0Qa0oi5P5QHBGBLHxxT833gqlcO41kAZuJDEjheqJ5Kqcqk
 uSfgeea7H+eCdKueDdGl5EWUHKQ==
X-Received: by 2002:a05:6402:401d:b0:49b:5a1c:9cb5 with SMTP id
 d29-20020a056402401d00b0049b5a1c9cb5mr6136311eda.16.1674022433101; 
 Tue, 17 Jan 2023 22:13:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMRQNeLN0f7U0iSpRPj/7pTZ3JgTXp3PTis3EaCSPjKRlhbStTsVCJPYygyXG1jLnP6DuINw==
X-Received: by 2002:a05:6402:401d:b0:49b:5a1c:9cb5 with SMTP id
 d29-20020a056402401d00b0049b5a1c9cb5mr6136300eda.16.1674022432934; 
 Tue, 17 Jan 2023 22:13:52 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05640243cb00b0049e19136c22sm3039222edc.95.2023.01.17.22.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:13:52 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
Date: Wed, 18 Jan 2023 07:12:49 +0100
Message-Id: <20230118061256.2689-8-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next 07/14] drm/nouveau: bo: initialize GEM
 GPU VA interface
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Initialize the GEM's DRM GPU VA manager interface in preparation for the
(u)vmm implementation, provided by subsequent commits, to make use of it.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index d2b32a47e480..4cdeda7fe2df 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -215,11 +215,14 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	nvbo = kzalloc(sizeof(struct nouveau_bo), GFP_KERNEL);
 	if (!nvbo)
 		return ERR_PTR(-ENOMEM);
+
 	INIT_LIST_HEAD(&nvbo->head);
 	INIT_LIST_HEAD(&nvbo->entry);
 	INIT_LIST_HEAD(&nvbo->vma_list);
 	nvbo->bo.bdev = &drm->ttm.bdev;
 
+	drm_gem_gpuva_init(&nvbo->bo.base);
+
 	/* This is confusing, and doesn't actually mean we want an uncached
 	 * mapping, but is what NOUVEAU_GEM_DOMAIN_COHERENT gets translated
 	 * into in nouveau_gem_new().
-- 
2.39.0

