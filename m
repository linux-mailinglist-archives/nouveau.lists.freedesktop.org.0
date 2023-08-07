Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4121772AF2
	for <lists+nouveau@lfdr.de>; Mon,  7 Aug 2023 18:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606F710E2CA;
	Mon,  7 Aug 2023 16:33:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B29510E2C6
 for <nouveau@lists.freedesktop.org>; Mon,  7 Aug 2023 16:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691425979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=piPAJWb0pb900GeCYfzlLDbns7cOjvHHVSLvNcNzuY4=;
 b=a39a3bpsTUMRF3+I4qykyHlp2ooNW/TsAy1nU+eh5SE9HQ3AtX/HpqnG85Jp5HEAa+uhC/
 ULiIac5X8eEfjodllbrXgvRRMk4UA0kvBWlvz8WIYx1OCLEaH5DvYmKw1gusHFKWy5WShM
 3WTpBDxhhtrqvpMg6gp667G5OYnVivU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-as442CdHNSCh3yZgPApM3A-1; Mon, 07 Aug 2023 12:32:55 -0400
X-MC-Unique: as442CdHNSCh3yZgPApM3A-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-99bfe3dd009so756789466b.0
 for <nouveau@lists.freedesktop.org>; Mon, 07 Aug 2023 09:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425975; x=1692030775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=piPAJWb0pb900GeCYfzlLDbns7cOjvHHVSLvNcNzuY4=;
 b=bARHmIyDtIgysFcMjWphe8HEtNZa0uJyibnp/E1ewQJUqfaVIQCvIxFlsB+fwCEx8B
 DHqbvuFvkNQQv+35ZJEhg6vdwvg671sIyBTlR4pdkQ5FFouVzfjQ9CoGJDJLD6jXJ5sn
 JNWtg3hhIv5APBAAmGg5J5dkDgNqk7tPdv1w8XED+ivkwZCTkvPav0HcYK8YZXaEZd2v
 LnMp4L9ORRb+kXjlPl9DBXdxFIzYj96oqUvu6b0oRT+utVH2I7b+ceembDWegn9V6v54
 kT5K9jKJN8UsGAAcz0Imd1SiRgXALNx7bz9eDxfKOGJACvmDKB0WgxQWtIYSeWU5ox2C
 HWOg==
X-Gm-Message-State: AOJu0YyNhuKLmA6c8doZK2nNM0lZNUnbRpkNZYnWxbxXf24SKjZXxb2+
 l7d2vmJfBdbP56zp70PpqK2jpd+oazkEbNYclYH/FS7TrSudPF1dxPx+XD8A3nLRUDV76sjRKtp
 yRwn5xMRBahsemg0fguZSAI475g==
X-Received: by 2002:a17:906:108f:b0:994:1880:dc32 with SMTP id
 u15-20020a170906108f00b009941880dc32mr8042329eju.17.1691425974848; 
 Mon, 07 Aug 2023 09:32:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAOrA3sQdOCxahpEKiwq8VOW54ZSfWV5X0WyopCri708v3H0dc43QYOi6NsAXi+7lwk8xLjA==
X-Received: by 2002:a17:906:108f:b0:994:1880:dc32 with SMTP id
 u15-20020a170906108f00b009941880dc32mr8042319eju.17.1691425974672; 
 Mon, 07 Aug 2023 09:32:54 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a170906560800b00992b7ff3993sm5334625ejq.126.2023.08.07.09.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 09:32:54 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, sfr@canb.auug.org.au
Date: Mon,  7 Aug 2023 18:32:24 +0200
Message-ID: <20230807163238.2091-4-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807163238.2091-1-dakr@redhat.com>
References: <20230807163238.2091-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next 3/5] drm/nouveau: remove incorrect
 __user annotations
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
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fix copy-paste error causing EXEC and VM_BIND syscalls data pointers
to carry incorrect __user annotations.

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_exec.c | 6 +++---
 drivers/gpu/drm/nouveau/nouveau_exec.h | 2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 6 +++---
 drivers/gpu/drm/nouveau/nouveau_uvmm.h | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index 42d9dd43ea02..0f927adda4ed 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -293,7 +293,7 @@ nouveau_exec(struct nouveau_exec_job_args *args)
 
 static int
 nouveau_exec_ucopy(struct nouveau_exec_job_args *args,
-		   struct drm_nouveau_exec __user *req)
+		   struct drm_nouveau_exec *req)
 {
 	struct drm_nouveau_sync **s;
 	u32 inc = req->wait_count;
@@ -352,7 +352,7 @@ nouveau_exec_ufree(struct nouveau_exec_job_args *args)
 
 int
 nouveau_exec_ioctl_exec(struct drm_device *dev,
-			void __user *data,
+			void *data,
 			struct drm_file *file_priv)
 {
 	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
@@ -360,7 +360,7 @@ nouveau_exec_ioctl_exec(struct drm_device *dev,
 	struct nouveau_abi16_chan *chan16;
 	struct nouveau_channel *chan = NULL;
 	struct nouveau_exec_job_args args = {};
-	struct drm_nouveau_exec __user *req = data;
+	struct drm_nouveau_exec *req = data;
 	int ret = 0;
 
 	if (unlikely(!abi16))
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.h b/drivers/gpu/drm/nouveau/nouveau_exec.h
index 3032db27b8d7..778cacd90f65 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.h
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.h
@@ -48,7 +48,7 @@ struct nouveau_exec_job {
 int nouveau_exec_job_init(struct nouveau_exec_job **job,
 			  struct nouveau_exec_job_args *args);
 
-int nouveau_exec_ioctl_exec(struct drm_device *dev, void __user *data,
+int nouveau_exec_ioctl_exec(struct drm_device *dev, void *data,
 			    struct drm_file *file_priv);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index b515a21aa08e..2acbac73e57a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1687,7 +1687,7 @@ nouveau_uvmm_vm_bind(struct nouveau_uvmm_bind_job_args *args)
 
 static int
 nouveau_uvmm_vm_bind_ucopy(struct nouveau_uvmm_bind_job_args *args,
-			   struct drm_nouveau_vm_bind __user *req)
+			   struct drm_nouveau_vm_bind *req)
 {
 	struct drm_nouveau_sync **s;
 	u32 inc = req->wait_count;
@@ -1749,12 +1749,12 @@ nouveau_uvmm_vm_bind_ufree(struct nouveau_uvmm_bind_job_args *args)
 
 int
 nouveau_uvmm_ioctl_vm_bind(struct drm_device *dev,
-			   void __user *data,
+			   void *data,
 			   struct drm_file *file_priv)
 {
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_uvmm_bind_job_args args = {};
-	struct drm_nouveau_vm_bind __user *req = data;
+	struct drm_nouveau_vm_bind *req = data;
 	int ret = 0;
 
 	if (unlikely(!nouveau_cli_uvmm_locked(cli)))
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index 3923c03012f9..534baadc3bf7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -89,10 +89,10 @@ void nouveau_uvmm_fini(struct nouveau_uvmm *uvmm);
 void nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbov, struct nouveau_mem *mem);
 void nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo);
 
-int nouveau_uvmm_ioctl_vm_init(struct drm_device *dev, void __user *data,
+int nouveau_uvmm_ioctl_vm_init(struct drm_device *dev, void *data,
 			       struct drm_file *file_priv);
 
-int nouveau_uvmm_ioctl_vm_bind(struct drm_device *dev, void __user *data,
+int nouveau_uvmm_ioctl_vm_bind(struct drm_device *dev, void *data,
 			       struct drm_file *file_priv);
 
 static inline void nouveau_uvmm_lock(struct nouveau_uvmm *uvmm)
-- 
2.41.0

