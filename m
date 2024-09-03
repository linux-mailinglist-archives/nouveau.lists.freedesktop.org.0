Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715A1969A6D
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 12:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBF910E42D;
	Tue,  3 Sep 2024 10:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Y5Eh1R5n";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D41110E3E2
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 10:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725360126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6lwmVfPx2sszsBri4TFoZL/uMUGIYxHzznRQSGZUMD4=;
 b=Y5Eh1R5nmsBJnrLN5glqpjT6FDg1jkPOTBlGqr98uWX38Ll2zoyRmAFOdG0hvhyLP2i7CG
 lF26Gi8HCIezZ03HY0JGReTZq2mz/a8/JG1/jszY99VEMKwGSVF9Po03QxpPkb3l7oY2Wx
 hWiiNxKvzhxxddOfOy1Qvk7k/oQ7bLM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-3lRIAaSSM5ujHFrbTtt3pQ-1; Tue, 03 Sep 2024 06:42:03 -0400
X-MC-Unique: 3lRIAaSSM5ujHFrbTtt3pQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-374cd315c68so1138408f8f.0
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 03:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725360122; x=1725964922;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6lwmVfPx2sszsBri4TFoZL/uMUGIYxHzznRQSGZUMD4=;
 b=El4/52DAoVAspyBVFMpJOlHbSDGvMu5A/oW+03omHwKZEP4Dtanu8g+Ymk3sMGeRIt
 0cwipooRvMOHnAK18qgOr22kEmSkaWM1iXNVKxNruqdpIPu9wrpBhKHf7w5gsUmHDdVH
 k6fFUS/6RX/stT0961TA1/eGlCy7qsXw/z7troHH1nZ21YHu5DXGQnIHgtBKMf88MEfz
 3OBgKd6dX3fBG9UHlyHgmBFWKBfpGNPs0/IdKM/OxvCXchX0u7X0yCbS+cQymJ8g5+ln
 vezLtctZAsIKcGtNUyNoE956kWPt5PUfTL2VjlmxpZzEdttG53EbWfWmiCD+9SQcFSmL
 3HKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjnvq/rlC5r9VOSuYVCuEZb9PbNJqYHj6ipRDhQMmXVxMa/QF1FnxffU/czDfB87xQfWlxoFlM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuCPtUTTpMasKEuq9Erbs8m0SDosmNQVeDdnAa7aSNIgviqEeE
 9e0OsaziW84dwMQcEQ0LeWMqGXtdb5EXZTMOtbkvRX6aU3sz9vQ+Atw5zIBVFNO4/aE0yAioYRz
 rxzbZUn063KrqT6348DM07cXYsfQNZyNUBS8eNrurTXpiJcAIawq5jcEZYIi0ISM=
X-Received: by 2002:a05:6000:18a7:b0:376:7a68:bc42 with SMTP id
 ffacd0b85a97d-3767a68c23dmr1148281f8f.27.1725360122018; 
 Tue, 03 Sep 2024 03:42:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn4YS9bNBLLWoNJTDrRNeKzv2DqbtrI+GY2Fyjm7bbAi6bx9DMubdkqlGYZw08xR/rtbBxWw==
X-Received: by 2002:a05:6000:18a7:b0:376:7a68:bc42 with SMTP id
 ffacd0b85a97d-3767a68c23dmr1148260f8f.27.1725360121455; 
 Tue, 03 Sep 2024 03:42:01 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df0a0asm167347215e9.13.2024.09.03.03.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 03:42:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 03/81] drm/fbdev: Add memory-agnostic fbdev client
In-Reply-To: <20240830084456.77630-4-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-4-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 12:42:00 +0200
Message-ID: <87jzftggsn.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add an fbdev client that can work with any memory manager. The
> client implementation is the same as existing code in fbdev-dma or
> fbdev-shmem.
>
> Provide struct drm_driver.fbdev_probe for the new client to allocate
> the surface GEM buffer. The new callback replaces fb_probe of struct
> drm_fb_helper_funcs, which does the same.
>
> To use the new client, DRM drivers set fbdev_probe in their struct
> drm_driver instance and call drm_fbdev_client_setup(). Probing and
> creating the fbdev surface buffer is now independent from the other
> operations in struct drm_fb_helper. For the pixel format, the fbdev
> client either uses a specified format, the value in preferred_depth
> or 32-bit RGB.
>
> v2:
> - test for struct drm_fb_helper.funcs for NULL (Sui)
> - respect struct drm_mode_config.preferred_depth for default format
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

