Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B606CF6C0
	for <lists+nouveau@lfdr.de>; Thu, 30 Mar 2023 01:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85C010E0E3;
	Wed, 29 Mar 2023 23:14:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0F510E0E3
 for <nouveau@lists.freedesktop.org>; Wed, 29 Mar 2023 23:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680131654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RDa5o+kZyCZFoDwvixD+yMC8DGY8pjS5wLyVr2om2qE=;
 b=MN7KF1G3kqjyvAM1Zf/cF3ZZCHd1rLB0Iou97JwRbK5SxCoSS8fs+X/MG8cFC67qVQqz3v
 SnlPJvN9ZJVtwzbDqScm9+IVO848EKuwjtvGqs52o4khwrdhCyDWukthU6JXESHX5wvHzi
 LMDA+AdT81rh1Gcm0DHY6ewRBGO3/4M=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-JeHvxsABPsmToCk5m-ANCg-1; Wed, 29 Mar 2023 19:14:13 -0400
X-MC-Unique: JeHvxsABPsmToCk5m-ANCg-1
Received: by mail-qk1-f198.google.com with SMTP id
 x80-20020a376353000000b0074681bc7f42so8106798qkb.8
 for <nouveau@lists.freedesktop.org>; Wed, 29 Mar 2023 16:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680131652;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RDa5o+kZyCZFoDwvixD+yMC8DGY8pjS5wLyVr2om2qE=;
 b=PnTojIo5OqEabYIGJ11A023fIUug2NvPDlpf6qWEyBfvftwbtCFVmG9F8JmBF1mRk+
 XYfbABSXaSvMsQhT5nUwQgOuk8BNE4jmW8ERdnn0DVRy1rrnLpBSWKgSIc1q7SHtUQrA
 f3ysjbJYEo6Y2e5+5tZ/U7UdT4v+yquZyL7clBBYznuxVpfqdGiSHARjTy/IhqkGrQh4
 Zi5lgEgV1nbg3yibTpTB9/dHj7F7yvoF5n/0aICofQPC5VpfBINtFY371NzOc3q9yhrR
 rrdOnD0OMQg0e7Ht8CxLI7v0/5KH5zv0x+BKbdgVhJJgaJN1uQrlHW2Xe4avdZKnNS2s
 QeEA==
X-Gm-Message-State: AO0yUKURDcpGWw/SFJRM23HwyR9h94wXGbpAsDijvJ/5smpGO/5bJQJE
 abHx0SxdmMJd7dHWfylLhyXVE9hF+liQBF4dGVRl0stkKIcBpEcRzUyOmL8wvw97cvfjwipOTiD
 xckqmmhxc2pySVPV0dRjFj0fWCA==
X-Received: by 2002:a05:622a:53:b0:3bf:c3e8:c19b with SMTP id
 y19-20020a05622a005300b003bfc3e8c19bmr39717920qtw.22.1680131652572; 
 Wed, 29 Mar 2023 16:14:12 -0700 (PDT)
X-Google-Smtp-Source: AK7set9FAlt8CkZ7gP0dtRURdKafeSyXrPgA0ctSwHl2YRdMc9jHIn4kx1HtMkkz0/D/w1j49owN7A==
X-Received: by 2002:a05:622a:53:b0:3bf:c3e8:c19b with SMTP id
 y19-20020a05622a005300b003bfc3e8c19bmr39717885qtw.22.1680131652329; 
 Wed, 29 Mar 2023 16:14:12 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 x16-20020ae9e910000000b007435a646354sm12246105qkf.0.2023.03.29.16.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 16:14:12 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com
Date: Wed, 29 Mar 2023 19:14:07 -0400
Message-Id: <20230329231407.1816570-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau/svm: remove unused ret variable
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
Cc: nouveau@lists.freedesktop.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tom Rix <trix@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

clang with W=1 reports
drivers/gpu/drm/nouveau/nouveau_svm.c:929:6: error: variable
  'ret' set but not used [-Werror,-Wunused-but-set-variable]
        int ret;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index a74ba8d84ba7..e072d610f2f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -926,15 +926,14 @@ nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
 		 unsigned long addr, u64 *pfns, unsigned long npages)
 {
 	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
-	int ret;
 
 	args->p.addr = addr;
 	args->p.size = npages << PAGE_SHIFT;
 
 	mutex_lock(&svmm->mutex);
 
-	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args,
-				struct_size(args, p.phys, npages), NULL);
+	nvif_object_ioctl(&svmm->vmm->vmm.object, args,
+			  struct_size(args, p.phys, npages), NULL);
 
 	mutex_unlock(&svmm->mutex);
 }
-- 
2.27.0

