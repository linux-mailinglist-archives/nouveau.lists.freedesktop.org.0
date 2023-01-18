Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883D9671398
	for <lists+nouveau@lfdr.de>; Wed, 18 Jan 2023 07:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF2710E686;
	Wed, 18 Jan 2023 06:13:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A9710E684
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 06:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674022414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bPNRTAzSirKPyPC/a7kemJ9gbWhkHOBWemjVPOdr94=;
 b=YVpiyCQXZKpcMcZrFioYkZAIv1enhimY9lKKsilWMnm/rGQbJ/vz9KdcGEuaHjo4VhbGHf
 7WrkSAWfWyhFFlL6kCtPvGxyLbo42epcUKsAGnbkwRbRemku2Uy+S8vHcrloZX3pJdCkqH
 B38rDm9zDPp1JyT8wN1fxbBQ03aZq1U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-OM4BV-6QPxCiC-ItvO4P9w-1; Wed, 18 Jan 2023 01:13:32 -0500
X-MC-Unique: OM4BV-6QPxCiC-ItvO4P9w-1
Received: by mail-ed1-f70.google.com with SMTP id
 y20-20020a056402271400b0046c9a6ec30fso22902127edd.14
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jan 2023 22:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9bPNRTAzSirKPyPC/a7kemJ9gbWhkHOBWemjVPOdr94=;
 b=aE5jzeBL8RYf+1OGyTQzBo6v8/hclM4Qwy6VPkCGe9anMT4Y+r+1Tv1SwZXdE6f2NG
 A9hpSqk1NjCdap9nRZ7DMTz735Yo4Lz5Tqi/0Dbij4e4zPgN9K49MtiNEOXOOSGlmlwB
 T85Vnrd1Xz6BJMDYanoKYIp4tGuCu7zY7L2BRWaGLrehzALHRkdExJrGfkiy405UPrw5
 ZneiglBVdDklQZslb9q4JSI91qINNwD8XLljlLLJ5+BUNHDTCpqxRbylEwdbWEUnxZYQ
 Z41OK6lVSqj4yq3Ra7vVEeqLIdm4t8fiEJb9YijE/UdWceDfVqSoGoS1oBLUCcJ4lCk/
 JnRQ==
X-Gm-Message-State: AFqh2koNCE1AJOsJkFrQpUH0nfrBBID6vaOjdulwFMhne9DQfbrJ6tuP
 UZ3P3lDJA88BqH8Q1QSapMtcg1cjHQJzt3flTXfi3oFMN4ALtFv62zKFSgzAOoBMVAsfbzlW4eL
 CfNkh6sEBAe2eZQp2TQFVYbgeMA==
X-Received: by 2002:aa7:c0d4:0:b0:49d:9bd8:6253 with SMTP id
 j20-20020aa7c0d4000000b0049d9bd86253mr6311444edp.17.1674022411762; 
 Tue, 17 Jan 2023 22:13:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtjvWeO5BcMo55Z0OQiMRRnw0jtETl53EDUmTCOZ9HyMXZACKq57o1DdaU9DHq6GmVA9kdq0w==
X-Received: by 2002:aa7:c0d4:0:b0:49d:9bd8:6253 with SMTP id
 j20-20020aa7c0d4000000b0049d9bd86253mr6311429edp.17.1674022411580; 
 Tue, 17 Jan 2023 22:13:31 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 y11-20020aa7c24b000000b004954c90c94bsm13745667edo.6.2023.01.17.22.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:13:31 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
Date: Wed, 18 Jan 2023 07:12:44 +0100
Message-Id: <20230118061256.2689-3-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next 02/14] drm/exec: fix memory leak in
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
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
2.39.0

