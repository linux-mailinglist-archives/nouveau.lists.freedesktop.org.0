Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CADFB7A24D6
	for <lists+nouveau@lfdr.de>; Fri, 15 Sep 2023 19:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536D010E651;
	Fri, 15 Sep 2023 17:32:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F3F10E659
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 17:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694799174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3iRbWt1YTt0h4sdUmK03Vi+q52/EZN5SzHkBsDxopwQ=;
 b=biVaaXNg3dY2s0Fcp5PeLWFiePscsdY4wZvaY8ZdVbFCiAVGMGLJD6DahQWdVZPrO4hdGx
 qTrT/Ob4KujIjGtYVijVWmctXzux/E94bVN2f5D45+LTFT+AvSPf0It8KDlp25YW9Dc6Zd
 bYBZJgC4dJi4R76+8mctdM3AzZUw30c=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-M9NUKHLHPgSElpeX08L8yg-1; Fri, 15 Sep 2023 13:32:52 -0400
X-MC-Unique: M9NUKHLHPgSElpeX08L8yg-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-76de9c09746so323402985a.3
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 10:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694799172; x=1695403972;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3iRbWt1YTt0h4sdUmK03Vi+q52/EZN5SzHkBsDxopwQ=;
 b=suzAlskQel6XvqoWq3G++hPDxgQy8D/2ZkW3pt3A8WvB2bN5GhDx2O+HfgKVIkv9Np
 75XtWufp7bmu52+Yg6l7gAfWFvsYJpt4+NHMtcu5ZMgFC1n/ZwE5j/Xrjgh3whnS+Xsp
 Eqhk5jeCUqCwJFxDBxYkLLjkiLj26Ne01WjqyFJLFFSgPBvTVO+7q2pkt5/FT8fEqHNV
 RL05AIdsML2zFqVQo6RPYmx6SdG8/pgcfVZFFQTYTDLh5LK/YqAnE6FeyelGd7uOhygb
 wXlugIuE3H2QeVodjRbfFPUQuf2aWTDDvIRFHOltG9n56r9Y0dSmdDcKMVZdJPkDWqsS
 04PQ==
X-Gm-Message-State: AOJu0YwMiX/FmLblEvxl+mQNP0St/VCWTo0f5gIaxhiH36RIg0/XqHiI
 A+R1bonpWJ8vYBLCuQEXV2EyZv9qSBgJWfvfwBdFUf5LKtlr/wpx0yMcsjl2MxcwQbavRpRH8bA
 Z9gO2Sj7YqL1odoYy0DIZ3hBCoQ==
X-Received: by 2002:a05:620a:450b:b0:76c:a9fb:6d07 with SMTP id
 t11-20020a05620a450b00b0076ca9fb6d07mr2820436qkp.2.1694799171896; 
 Fri, 15 Sep 2023 10:32:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETBX46w8bl1e85ceIF07jVSYpOO67r7UYVTVMH7Dqpa2+cz1AIiLu9iLVGSZRmJCWMnZIaqw==
X-Received: by 2002:a05:620a:450b:b0:76c:a9fb:6d07 with SMTP id
 t11-20020a05620a450b00b0076ca9fb6d07mr2820408qkp.2.1694799171623; 
 Fri, 15 Sep 2023 10:32:51 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 pa9-20020a05620a830900b00767d572d651sm1364433qkn.87.2023.09.15.10.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 10:32:51 -0700 (PDT)
Message-ID: <43da274f22acaae8b917f51f6e62376928163e8f.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Kees Cook <keescook@chromium.org>, Justin Stitt <justinstitt@google.com>
Date: Fri, 15 Sep 2023 13:32:50 -0400
In-Reply-To: <202309142158.59A6C62F@keescook>
References: <20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-engine-pm-base-c-v1-1-4b09ed453f84@google.com>
 <202309142158.59A6C62F@keescook>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/pm: refactor deprecated strncpy
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
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-hardening@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Nice catch!

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push in just a moment

On Thu, 2023-09-14 at 21:59 -0700, Kees Cook wrote:
> On Thu, Sep 14, 2023 at 10:17:08PM +0000, Justin Stitt wrote:
> > `strncpy` is deprecated for use on NUL-terminated destination strings [=
1].
> >=20
> > We should prefer more robust and less ambiguous string interfaces.
> >=20
> > A suitable replacement is `strscpy` [2] due to the fact that it guarant=
ees
> > NUL-termination on the destination buffer without unnecessarily NUL-pad=
ding.
> >=20
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#st=
rncpy-on-nul-terminated-strings [1]
> > Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en=
.html [2]
> > Link: https://github.com/KSPP/linux/issues/90
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
>=20
> The "- 1" use in the original code is strong evidence for this being a
> sane conversion. :)
>=20
> Reviewed-by: Kees Cook <keescook@chromium.org>
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

