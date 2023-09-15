Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A7F7A14F9
	for <lists+nouveau@lfdr.de>; Fri, 15 Sep 2023 06:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D41110E5BF;
	Fri, 15 Sep 2023 04:59:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49AC10E5C2
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 04:59:27 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c3cbfa40d6so15596335ad.1
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 21:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694753967; x=1695358767;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BYRpyQlIT436zPtN6nLdUj+VpyPz7BPfenc2yhNBnyA=;
 b=VQkrjVSrVgow9Zv8yBr1s6KLehh3/LcxaQV0noAJE76htLbe82IVpCjoJL3pG1W1/u
 QrIUzT6hTr0+VWFDYBae17AgoVBl31HwKYnh2RB3/mQys132ZDHdE4rdE+YGGpd01Uxb
 lgOY/G6QT7WAO6mUYY569+SrFF0OMk31lWeas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694753967; x=1695358767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYRpyQlIT436zPtN6nLdUj+VpyPz7BPfenc2yhNBnyA=;
 b=ITm9v++0lhv+brQOgQ9tzyteDO19qHWaJB1HfGYvRqKKWKgGCZ1eJCjW3sxKPilVBx
 B3uX4oY4mVRJvjW5c+Bi0WHBGr0ERBoHkwLwCKO4LZRWeJ1VgOpZMh26okncu7REIvjD
 pXZVSuO1tDyvHndPAtZG/cie3AqSDC6+MaUt3G4FjEwXqk6Fg7212NhOLPJAk+E8kx+/
 Ngd9zGnbh9vEuAddOBqPhLCXM/XAzxSfUwCe5qF2wrbpQsWpQlh2HOjDNWDQFqiJd8U9
 h1p0/fVqfw0dfMj5XYViGkBCKdsYlvXRA5dry1SyWXXzITs6rsQaURA/tfvAN6C8u00I
 2F2w==
X-Gm-Message-State: AOJu0YwWcfWdA8CWFj1xBpHKdJ8PSpyvbk84GUqrTq+v6zVpZQEuZSNV
 /WZDzOganzeRbsTD3oNKZPxVsQ==
X-Google-Smtp-Source: AGHT+IHpnSwhbI66lN4Z3sU7pXA6O9Wq2OcHhE6YgrndvyVXYXJ9PNFRMH9fyCLkUgX/bGvjpC5C/A==
X-Received: by 2002:a17:902:7081:b0:1b7:fd82:973c with SMTP id
 z1-20020a170902708100b001b7fd82973cmr618871plk.39.1694753967460; 
 Thu, 14 Sep 2023 21:59:27 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001c0a414695bsm2461749pld.43.2023.09.14.21.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 21:59:26 -0700 (PDT)
Date: Thu, 14 Sep 2023 21:59:26 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Message-ID: <202309142158.59A6C62F@keescook>
References: <20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-engine-pm-base-c-v1-1-4b09ed453f84@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-engine-pm-base-c-v1-1-4b09ed453f84@google.com>
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

On Thu, Sep 14, 2023 at 10:17:08PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy` [2] due to the fact that it guarantees
> NUL-termination on the destination buffer without unnecessarily NUL-padding.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

The "- 1" use in the original code is strong evidence for this being a
sane conversion. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
