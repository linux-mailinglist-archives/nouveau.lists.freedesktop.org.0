Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF54794B7D1
	for <lists+nouveau@lfdr.de>; Thu,  8 Aug 2024 09:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F8610E677;
	Thu,  8 Aug 2024 07:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iwZOYdL4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A5B892D3
 for <nouveau@lists.freedesktop.org>; Thu,  8 Aug 2024 07:25:56 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52efbb55d24so1072470e87.1
 for <nouveau@lists.freedesktop.org>; Thu, 08 Aug 2024 00:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723101955; x=1723706755; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hNGzsNH/t8Akb4VG9W8tz0cWmhUFTpFrDSlsiKAVghI=;
 b=iwZOYdL4/WCg7AfSXgVjE82QPzOY9ZSQ87u3JhHmE1+pmpVzJ3O7YxKI+6ULuMWfRi
 imoxmUdc83E8sVP9SnqI042NZhTfPsPJLdz9LVddQfnrASMZ3CtfeHyQG/Ky9tbhw3Vj
 8dwVfaOx9hrRRAkIDPKH1t4EF1c1JNwt8Kt3FdUWgWcZFVXoWdNtWjHXJaidcbDXqU1m
 JsPSp2hUQCliUURc6s9lf/TaUGlP+pPpFAVG5kMSEvNvbT1BnlWTxypnuWTmKe3x8XZ8
 PevEs8Le5bchYvwCyLnzbr+ctX3XTkO+ijLHtgw+4Male6weSYKXL+wBoyD5AUm9BkUG
 8XUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723101955; x=1723706755;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hNGzsNH/t8Akb4VG9W8tz0cWmhUFTpFrDSlsiKAVghI=;
 b=U3acgig/Pgqz+25B2+qUocnLdYQGKSH9TGMEeJKRgJsdoGNVeLufRoRueC1DIHi1x4
 Bg7J6SeOSEuOvJb1ZfEo+AvXKaQ4CyUfnacRmjhgx87VBlTYpCxdJXg/JM0mSwEk2P4w
 Wh5FxBVUNwdU22VirUl8T7izknij1cEU76Kv2rXrEQNVNA2XK4QR+D/Q0p2e+2Z8EqAK
 UW+emUujrKzh72ehBcTV7Od3IJOZtYsdyMXdE2zVdYV9IHecqKDqHQBsY2TvJkcpLGMp
 K8Rpdrnr40PXzXNBPOv3zZVq5BT+RGVG1bEkQ0C9NGzXw1/bRj5T47rxQBCegqBVs4Zf
 PZpg==
X-Gm-Message-State: AOJu0YyLMSkU6BvawAUCjjkih9P0VimBtv4XMWcfdjq3VQ8qUppYkjcc
 skc2KHnQrNZH1jnPdhqJfe2/gt0208DcEe6Qrn2kpuUyI/WI4Vow8fi5uS3hmjQ=
X-Google-Smtp-Source: AGHT+IGWsVQeN5UxukKsHwoRTO2H9Z+tyf86VPC12xLF7j/Iqde20bkc1MuEV2hDgzErLhnMkhGClQ==
X-Received: by 2002:a05:6512:31c4:b0:52c:df8e:a367 with SMTP id
 2adb3069b0e04-530e588c543mr899477e87.53.1723101954634; 
 Thu, 08 Aug 2024 00:25:54 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c0c526sm712447866b.69.2024.08.08.00.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 00:25:54 -0700 (PDT)
Date: Thu, 8 Aug 2024 10:25:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org
Subject: [bug report] drm/nouveau: use GEM references instead of TTMs
Message-ID: <a990574d-1000-4302-9420-780c67c3b85e@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Danilo Krummrich,

Commit bf32a3a12686 ("drm/nouveau: use GEM references instead of
TTMs") from Jul 18, 2024 (linux-next), leads to the following Smatch
static checker warning:

	drivers/gpu/drm/nouveau/dispnv50/disp.c:2818 nv50_display_destroy()
	error: we previously assumed 'disp->sync' could be null (see line 2816)

drivers/gpu/drm/nouveau/dispnv50/disp.c
    2804 static void
    2805 nv50_display_destroy(struct drm_device *dev)
    2806 {
    2807         struct nv50_disp *disp = nv50_disp(dev);
    2808 
    2809         nv50_audio_component_fini(nouveau_drm(dev));
    2810 
    2811         nvif_object_unmap(&disp->caps);
    2812         nvif_object_dtor(&disp->caps);
    2813         nv50_core_del(&disp->core);
    2814 
    2815         nouveau_bo_unmap(disp->sync);
    2816         if (disp->sync)
                     ^^^^^^^^^^
Check for NULL

    2817                 nouveau_bo_unpin(disp->sync);
--> 2818         nouveau_bo_fini(disp->sync);
                                 ^^^^^^^^^^
Unchecked dereference.  The patch didn't actually introduce this bug, it just
exposed it to the static checker.

    2819 
    2820         nouveau_display(dev)->priv = NULL;
    2821         kfree(disp);
    2822 }

regards,
dan carpenter
