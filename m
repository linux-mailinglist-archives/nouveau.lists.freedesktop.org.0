Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA047292362
	for <lists+nouveau@lfdr.de>; Mon, 19 Oct 2020 10:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010946E0D5;
	Mon, 19 Oct 2020 08:06:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C876E0D5
 for <nouveau@lists.freedesktop.org>; Mon, 19 Oct 2020 08:06:56 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id i2so10903074ljg.4
 for <nouveau@lists.freedesktop.org>; Mon, 19 Oct 2020 01:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:user-agent:mime-version
 :content-transfer-encoding:content-disposition:message-id;
 bh=rUKOmkJBjVNDlrKrhLnnQpVql2ZrXVcs07UYwgVO5gA=;
 b=N2ZEGL8Fmz0JziTZ0aCV2HFfTy+m+AiS26nBMVF9vw88dZ9GMgQuDmE2K6gfPFqvnD
 vLn0gH5TM0BXumytml6MImzuTZYMWE3aQNPwc/wotjRY7PLr+Ct2LDLuOutpD71JjRf7
 C1aaP03XcbalULwqtbHYABB21nryPlSZJQRNtMDjjAboVikc1Wfghyw0BF+XacmAzjKX
 h+n8kxZ9uJo/IKK9hglhjdE0OHH+EIgVKjtHz2ugt7xe8ehCttuEL5kOVfZsVMVlYvAi
 0UXb+eH8r2KIOouii0/oGodoSQ1YXlXcp86fYbBhoCFbn20kCyusa5e5gmME4azdfztQ
 mSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:user-agent:mime-version
 :content-transfer-encoding:content-disposition:message-id;
 bh=rUKOmkJBjVNDlrKrhLnnQpVql2ZrXVcs07UYwgVO5gA=;
 b=GAMLbHelsUqVcEQEqs1yXyOFyL8l+D8Uhp5qM4mj4CsD9bEqGV8qhGN4kvnF6eg1Qx
 bN8XShxRPdo4+af1bxoKkQwUL91XwKQFXA8fW97a3xnxz+EWjBtl127XvD6zmkfJS2ek
 S6AQcdXTatmOsqK5I0mDP55CrBrue17f0PQdY7XY+KmBlBsWNQlEK6yNC2CmLm+XA19G
 YYawsq5tYdLu20QAqXMm5l3ZbshEeDGp/j6Vz5bK5swHtCDC7RmcNUGMXi9bfdyOALzI
 r07wrpGYSDQMVmLN9mR9KPrzZ8IT2T7zfincXDl5JQKWGjbsePklCZjt/InFDm9rysLy
 JmOA==
X-Gm-Message-State: AOAM530puhyWo1ySlYOtyCpNC/j1YqMn4EHC0yr8W6EMLJn8Y7higtvv
 aSpV/YbjTV8A3FKrStkmZ5LuWxeC9RY/sA==
X-Google-Smtp-Source: ABdhPJxQjwSqcVtsSlgTwtv051i2+dJzpWrv0fR/t75jyvul8FuUo/FcJGxuSkrxoqNCVhdf63N2xQ==
X-Received: by 2002:a2e:88c9:: with SMTP id a9mr5647603ljk.193.1603094815234; 
 Mon, 19 Oct 2020 01:06:55 -0700 (PDT)
Received: from [192.168.1.100] ([176.116.252.109])
 by smtp.gmail.com with ESMTPSA id t80sm3128841lff.72.2020.10.19.01.06.54
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Oct 2020 01:06:54 -0700 (PDT)
From: Andrew Randrianasulu <randrianasulu@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 19 Oct 2020 10:53:23 +0300
User-Agent: KMail/1.9.10
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <202010191053.23735.randrianasulu@gmail.com>
Subject: [Nouveau] Small patch for nv50_vbo.c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi all!

I saw TODO comment in nv50_vbo.c and decided to look at similar file, nvc0_vbo.c. I copied those two lines into nv50 with slight name change (nvc0->nv50) and apparently it doesn't fix any OpenGL app I have, but does not broke them further (I have compute pacthes currently applied, so some breakage expected).

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
index 8d1c8c7665b..29b63a525aa 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_vbo.c
@@ -189,8 +189,12 @@ nv50_user_vbuf_range(struct nv50_context *nv50, unsigned vbi,
    assert(vbi < PIPE_MAX_ATTRIBS);
    if (unlikely(nv50->vertex->instance_bufs & (1 << vbi))) {
       /* TODO: use min and max instance divisor to get a proper range */
-      *base = 0;
-      *size = nv50->vtxbuf[vbi].buffer.resource->width0;
+      const uint32_t div = nv50->vertex->min_instance_div[vbi];
+      *base = nv50->instance_off * nv50->vtxbuf[vbi].stride;
+      *size = (nv50->instance_max / div) * nv50->vtxbuf[vbi].stride +
+         nv50->vertex->vb_access_size[vbi];
+//      *base = 0;
+//      *size = nv50->vtxbuf[vbi].buffer.resource->width0;
    } else {
       /* NOTE: if there are user buffers, we *must* have index bounds */
       assert(nv50->vb_elt_limit != ~0);

Does this look correct?


_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
