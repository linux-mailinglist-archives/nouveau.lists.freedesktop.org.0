Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B04A89AEC10
	for <lists+nouveau@lfdr.de>; Thu, 24 Oct 2024 18:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691D410E38E;
	Thu, 24 Oct 2024 16:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fdGRwmWs";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372B910E38E
 for <nouveau@lists.freedesktop.org>; Thu, 24 Oct 2024 16:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729787391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JZXCwg6hYJwlV3dQoijUPbMEIAM4RESJSpWVfasu2GA=;
 b=fdGRwmWsqj+lueErmglc1O03FFyhlr7+9pEdARz3JBGWrD4TSCEIh3blrr6F2eMu+UWGQT
 uBNPQmfBsE2nkHNLJJD2W+1nhZsw1pNIaVohT2YFi7dYo7Fr78sTVT7Rx+3SxiYF2Z/kJK
 E2EIcadfe7Ubo1M0WucEfEqaeG3vcDA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-heg35A1SMG-rL39VVnNNww-1; Thu, 24 Oct 2024 12:29:50 -0400
X-MC-Unique: heg35A1SMG-rL39VVnNNww-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4316300bb15so8202115e9.2
 for <nouveau@lists.freedesktop.org>; Thu, 24 Oct 2024 09:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729787389; x=1730392189;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JZXCwg6hYJwlV3dQoijUPbMEIAM4RESJSpWVfasu2GA=;
 b=gwy2I1CYgnFzwICL5WSAieUD6IBN8VIl2y+NbpLRdAIf00zR3r6zrZWXvSdOuxRxCd
 Yt/IJ4oMaUW0O/te0h3WjIBwSkxRIWZPIoPF9acN4HeP2GL0fFFjJo8ACdE51ZdGpbtH
 pa5qBhL7/nKRVs4i7JesKtlFGP2TX0RtqRKff9YatYp6ao8DrjhxGpoR1ZLfT5qOgwQM
 tC1iVzM8etnm46r6uwsHLlFhpBfpNQ7vToggOfIVE4R6P9MIDqNAmFztkWTVBfDpGdrZ
 mtujj6Y+oGDIU6cdavPOkOL84qBzPdWcYYRbZou+EWKdOZCS74AdkpzzohrzwMiUJhv0
 IrVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOcmBb9uHofquETfFmRIIyaz1UZR7JbzKJKjK7/o/5YeXNCeVHDuRdlbqHsLpYTr8euRdU4qrt@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKBuyguFdWTB07YkBoNLfUQe3wsU2oW8jIZoVscCLmmdIS0tji
 bypw6cyIvmY2jj2OrJ/f/xvoIGsZtVCcF0U2+fid+D0SArKsht2dV4TII9ZLw1R/5lxm7b5VpdW
 irTPTDIhwnIgi0vN02vPhw1GqPmtCOraLJNH+H9b2VfSFjFp8fTYFWePbpdw67hk=
X-Received: by 2002:a05:600c:1e16:b0:431:561b:b32a with SMTP id
 5b1f17b1804b1-4318c6f505cmr23112365e9.19.1729787389129; 
 Thu, 24 Oct 2024 09:29:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET7dTcaOAuam5O1YOxfn6XKm0SifRdkj3JgT8AA6xwQNV6mNJK26LyEtPp9s4XkYUWZXGjDQ==
X-Received: by 2002:a05:600c:1e16:b0:431:561b:b32a with SMTP id
 5b1f17b1804b1-4318c6f505cmr23112135e9.19.1729787388661; 
 Thu, 24 Oct 2024 09:29:48 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43186c1e911sm50457715e9.45.2024.10.24.09.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 09:29:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, David Airlie <airlied@gmail.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Simon Ser
 <contact@emersion.fr>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drm: remove driver date from struct drm_driver and
 all drivers
In-Reply-To: <20241024162240.2398664-2-jani.nikula@intel.com>
References: <20241024162240.2398664-1-jani.nikula@intel.com>
 <20241024162240.2398664-2-jani.nikula@intel.com>
Date: Thu, 24 Oct 2024 18:29:47 +0200
Message-ID: <875xph1n2c.fsf@minerva.mail-host-address-is-not-set>
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

Jani Nikula <jani.nikula@intel.com> writes:

Hello Jani,

> We stopped using the driver initialized date in commit 7fb8af6798e8
> ("drm: deprecate driver date") and (eventually) started returning "0"
> for drm_version ioctl instead.
>
> Finish the job, and remove the unused date member from struct
> drm_driver, its initialization from drivers, along with the common
> DRIVER_DATE macros.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

