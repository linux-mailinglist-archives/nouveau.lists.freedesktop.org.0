Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503ED969B48
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218B010E480;
	Tue,  3 Sep 2024 11:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iTPC5yPL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C6B10E480
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725361995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eNaLJCzc8McH6yKUfj3b0fV3lUF+xcAOFhE3bUUfh6Y=;
 b=iTPC5yPLkmUSOh+RjfDuy2ZYvMhO/TKt1+9kZgFBEiB7beCrTPosoTKTQPAAE4a1yvezPQ
 m9CnLViBY2zra2WdpWZ1Uy0rzHDyFSmy2IDsT99Vjm9i1iLzEPo9wbX8284e9c9QE5BSmS
 lXxSjGlr3n9hoZWJYzKmYsLP/sg0CZs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-h1reEJrcO2ih0ygTnvgzxA-1; Tue, 03 Sep 2024 07:13:12 -0400
X-MC-Unique: h1reEJrcO2ih0ygTnvgzxA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42bbff6a0aeso33192945e9.3
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725361991; x=1725966791;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eNaLJCzc8McH6yKUfj3b0fV3lUF+xcAOFhE3bUUfh6Y=;
 b=Ty+jT+NS11qqPYoGi79HxR/ynQc8TLK8vKHnonPcSNL0aO/KMbEh4ObZ2wiGwD6dyL
 ZH0uhXWSmqqAVBQKrraRd0YMlH/syCXA/+4IKJAE4VkEPVOylrV9V/x5QRBmGvC9AAFp
 3KxnweJOi4SRQUhEe1c5S8yNP+K80bNy1/lo1cvIWf+BDRK4SXFLOgd6pG5C7r+tWdXZ
 owmyuQ4Vjqk6S/DNyFZAbKgt+Iwya0ts21+K3JJOrHRtE2Thc3O+AEUl+9M0VNEdUFaX
 DDI8XwR1R9iMymw3hlmGRK0TAhcYIxEf1u/Ms91W/YpOmPdIyC+Wy/N3pZNt78iLPMST
 LHaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxjCKq2+LW7iQGnsWwfQ/uOT7KdyglfIMNrUXVYr/VtDqB3yl/NEpwGm6UzmWCuSDa8nmNK5Mo@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPuJafbJqwPXzZSQEXZufdqg01LYME0Mm+qcyh35MTlK7znbid
 +aS93w8X22p7hoHP8FHm2VNl0DRD5V8Yl+lXoCof5thX/xJcA9xa0oCqihFC3JzdmtrSB3LRvGw
 Y5n6kzwMRKeZxiBA1/VscgM32X4/Qu4olFMmCKQ9yvthicWTyaLWcnHigXNKHcso=
X-Received: by 2002:adf:e042:0:b0:374:c8a0:ca8c with SMTP id
 ffacd0b85a97d-376dea47175mr310997f8f.43.1725361990983; 
 Tue, 03 Sep 2024 04:13:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErKuUaZwDVmhsR7doTbtSmBnmM7k053hpSErI0ylM4sAqourCJsbqDohSz+3dvc+wiabrelQ==
X-Received: by 2002:adf:e042:0:b0:374:c8a0:ca8c with SMTP id
 ffacd0b85a97d-376dea47175mr310977f8f.43.1725361990502; 
 Tue, 03 Sep 2024 04:13:10 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm167087945e9.18.2024.09.03.04.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:13:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alexey Brodkin <abrodkin@synopsys.com>
Subject: Re: [PATCH v3 06/81] drm/arcgpu: Run DRM default client setup
In-Reply-To: <20240830084456.77630-7-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-7-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:13:09 +0200
Message-ID: <87ed61gfcq.fsf@minerva.mail-host-address-is-not-set>
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

> Call drm_client_setup_with_fourcc() to run the kernel's default client
> setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> v2:
> - use drm_client_setup_with_fourcc()
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

