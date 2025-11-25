Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2AFCBAE3F
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F388010EBED;
	Sat, 13 Dec 2025 12:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxdtE+mo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C3B10E437
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 15:47:40 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-657230e45e8so2140866eaf.1
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 07:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764085659; x=1764690459; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vwd7GiN0LhHHn+1+8fCmutdytRAkrux2QdVf0iABeVI=;
 b=SxdtE+moJwAhGbNnxnltRQoGXs+x9vyE77cpjUT0Z2lSWuBJTJdDrrCbhG2cVSUR87
 w/hel1gvSdIQqUyx2lIhxXalwEE/LEtCXRPESocZ/Hf+1KSJQCHmrzC7VujxZnmeD9+G
 SPz39f5TxqfsM3AS0TgGcAw+87NItrpwBrhEnRjuHIiY/F6JGnsxDzMjvHKGLXOKW39g
 ggrTtGsJ4/EbWFxxcWzZJzAaHXXSNVGjb6gfQ1sNcfM64c06ztXqvmFwSnPLgNi4aOrc
 B0250+lZnpg1pukfXizRXvv+B/eFBFrQDFaYdrnZ5lSRMVN8LdwWfO/8osafGPmhnSQX
 0J3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764085659; x=1764690459;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwd7GiN0LhHHn+1+8fCmutdytRAkrux2QdVf0iABeVI=;
 b=Hm1tEIg1I+S/UZQwcA+0BJobpoxJCll+XIFekrSduOL8TUpY0JV1D3HJSO+bALyiwT
 Q29LqCB9OWsTY7rtU0/32QnmtuLehlHE1gFX4VSq0o1qQAKdhx8IYSrmlvTOWWCdKzEP
 JkIXvN3KF70fLSVdWODDE9uXZhoVgrAEGlP5W8rnlZX732a2X/9MudEVTO2Q81IAsjLH
 76rEpYfO87plMag1AJapek9az2G30OVaKEiYv9MS1Ix2dzwySWHIuHtthImOy006Q8qC
 P2/UlTK0XEHfH2fkHQHNIL0XjvKWEO0DjrEv0b4fFWblWYb+T9D7lJJltoA4IfLeNRMX
 nUAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPQIAODtzj9dV7+rIwbevOsQ1C3w2TPOOZPgPVH00DaRwXlI26xa7ViUBYCOrzssPyQ2PawGBm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOK4GVJUV/LF/H7Vcv8BDMbF0BK8qBn1HwaHce59HmGqShfyL9
 Ay0PUxqKOxxCnWt0A0BWC3DV3em9b0W92pvUehownIREbfcIWWx4r0A2
X-Gm-Gg: ASbGncsPUOv4s8FG4xR540GR0b90gkB37/sErJEQJOZtuJpMy/NlB1pgzKjn4HQ2tlr
 Y86mBQvp+AUdjJ20Imb+w6MtTlaGvaYrA7QA64ukn5P8m+Wi+awKltMLEuHmJaVFsUp8tvbLnID
 JdUZq0QbXYxaBWRiKqhtbxkFWof5ftPfKBSZJRBSbfT4efrkU7vytN9s0LqDfu6N87k8q0b/qpP
 lbzYA3e2bpTQgGeQaFwrSGTT7nTsbBKa1C0yNXhPgkStIsL9rwQQRGAa8GUHVuGuv3EeCKckZ58
 iM5rt/rcu0mSqya0t8m0pAdkzgwGLS2aeKYDc79jIHp1SwJ24o01c4dJnR+rEL11EAAII91TRes
 okUEijVthRw+lra4VqUdcGXQUff7umRojFCRxLsp9UFY+FUgGp+YFrhsGgwb/ztrcQwkwB++4qP
 Oxjny0IUI9G4abaXDzzv4Kukgvyj1Tig4=
X-Google-Smtp-Source: AGHT+IHiuoQZzYWwy314lRsUMafz3cwaDnTm31WJbXtW7FkNI3HiSFHTqV00n0ZzdvjwbdNNHFnnig==
X-Received: by 2002:a05:6808:1926:b0:450:cd83:80d6 with SMTP id
 5614622812f47-45112af3534mr7396381b6e.16.1764085659162; 
 Tue, 25 Nov 2025 07:47:39 -0800 (PST)
Received: from SyzRHEL1.fyre.ibm.com ([170.225.223.18])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-450fffed315sm4633108b6e.21.2025.11.25.07.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 07:47:38 -0800 (PST)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: lyude@redhat.com, dakr@kernel.org, mripard@kernel.org, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com
Cc: tzimmermann@suse.de, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,
 Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] drm/nouveau/mmu: add NULL check for args in
 nouveau_uvmm_sm_prepare()
Date: Tue, 25 Nov 2025 07:47:29 -0800
Message-ID: <20251125154729.434072-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:43 +0000
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

nouveau_uvmm_sm_prepare() passes the uvmm_map_args pointer (args) to
op_map_prepare() without checking for NULL.
Prevent NULL deref in op_map_prepare() by checking args before use.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 79eefdfd08a2..7a33ce63770c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -627,6 +627,10 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 		case DRM_GPUVA_OP_MAP: {
 			u64 vmm_get_range = vmm_get_end - vmm_get_start;
 
+			if (!args) {
+				ret = -EINVAL;
+				goto unwind;
+			}
 			ret = op_map_prepare(uvmm, &new->map, &op->map, args);
 			if (ret)
 				goto unwind;
-- 
2.47.3

