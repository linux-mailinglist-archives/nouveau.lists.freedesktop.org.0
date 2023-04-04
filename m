Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6B16D55DF
	for <lists+nouveau@lfdr.de>; Tue,  4 Apr 2023 03:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB2210E1C8;
	Tue,  4 Apr 2023 01:28:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D907810E1B2
 for <nouveau@lists.freedesktop.org>; Tue,  4 Apr 2023 01:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680571676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qy5D/ZZ0dwag1BT8hM3evEqOdQXhrzVTN7mL8aXSMGo=;
 b=CshnjORxmNKltlAAsPW89y32wRKHVa8MZGwn2mCJTjCYOQaC8uAem36/0FS5jjJr9cJjnn
 409r36nAeVLHzns6cK243cmik9N8MVrdu9s2ZGRuEEJxmX9dXtqDtaf7pA3nA4fcASdyfZ
 C6Oyj7ATck9SegzXRymk6/nTNKUZmsU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-PUV2mOzmNvu4S3q5ElvpKg-1; Mon, 03 Apr 2023 21:27:55 -0400
X-MC-Unique: PUV2mOzmNvu4S3q5ElvpKg-1
Received: by mail-ed1-f70.google.com with SMTP id
 b1-20020aa7dc01000000b004ad062fee5eso43246134edu.17
 for <nouveau@lists.freedesktop.org>; Mon, 03 Apr 2023 18:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qy5D/ZZ0dwag1BT8hM3evEqOdQXhrzVTN7mL8aXSMGo=;
 b=HhT3sFFy4G1R4XWAvCFnGHHVR9sF4TqMA3mioOx9IUSYTbgYSwKSlSkayj/LOULco/
 wucJuMB3wzNqe0v1E3qlVJBjrVmhoTuXSTr/EwDRdErLbBJGKTweG9oSP6YCKzu1kVxB
 aiYNl1WS0f+TXngsNNDsMY/1JeWbIiDwDFmPMhi0oBgtu/AQH4mWEfIch3j5beEUvuJv
 dO3eWLjEGJ2xKKoLXneWtbB/UvDUOqu26+7EYEVvbi2lSPUBcc401TXbsbvnUCKoWfX9
 Ke5V7Z0mhm7vWgsdWXozN4pF7symnPzt5vd0NDstGq0cEXqdHJdpFcnvrDxfYN3n8VVp
 3LNA==
X-Gm-Message-State: AAQBX9cc/AmAlbTh2Cj+VezSB+DytlCYDolQPYnoXM/MWCoWbohjpPkB
 WQm9Nro3fX2gXMK5MbsdoAWpaieWfGgA3aWfrvf5u+YslIfayA6BBP1nnRthqrhWS/A4bVgovhw
 R1hSU5RmBMyOiyKQ/J87y86Snyg==
X-Received: by 2002:a17:906:4dc1:b0:8b0:ad0b:7ab8 with SMTP id
 f1-20020a1709064dc100b008b0ad0b7ab8mr537810ejw.14.1680571674351; 
 Mon, 03 Apr 2023 18:27:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350aYg00eHiyswbtoLlF56sjeND5GW8MPldJF2FDkJFmQJWCtDChMw3C466wihCFb4E1/7woEmA==
X-Received: by 2002:a17:906:4dc1:b0:8b0:ad0b:7ab8 with SMTP id
 f1-20020a1709064dc100b008b0ad0b7ab8mr537795ejw.14.1680571674124; 
 Mon, 03 Apr 2023 18:27:54 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 mh13-20020a170906eb8d00b00931024e96c5sm5222682ejb.99.2023.04.03.18.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:27:53 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Tue,  4 Apr 2023 03:27:28 +0200
Message-Id: <20230404012741.116502-3-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404012741.116502-1-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v3 02/15] drm_exec: fix double dma_resv
 unlock
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

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_exec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index df546cc5a227..f645d22a0863 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -62,7 +62,6 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
 	}
 
 	if (exec->prelocked) {
-		dma_resv_unlock(exec->prelocked->resv);
 		drm_gem_object_put(exec->prelocked);
 		exec->prelocked = NULL;
 	}
-- 
2.39.2

