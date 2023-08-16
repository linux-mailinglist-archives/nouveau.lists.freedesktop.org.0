Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC3C77EAD3
	for <lists+nouveau@lfdr.de>; Wed, 16 Aug 2023 22:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447D910E3B5;
	Wed, 16 Aug 2023 20:38:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B3910E3B5
 for <nouveau@lists.freedesktop.org>; Wed, 16 Aug 2023 20:38:54 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-565f24a5c20so172267a12.1
 for <nouveau@lists.freedesktop.org>; Wed, 16 Aug 2023 13:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692218334; x=1692823134;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cF1BM3f2bxhcGy+lZOB+pU20s/yGXG20KfnXyoafx1I=;
 b=S1cecA8Y35UFe/B7wgZ82/ZTWMSsufbVjFnSUYcJB3o8aMW/V3gdW/NqqjLGmO+/Nr
 p8v0eiPJZuYK4vEcgNTVWplYOR4aqODDHJvhA5an/IVfLeY6N1sDRsz3rQxNBzwBiMVD
 4gs2IAjxEHrARmE99bg7/U1Ht2qAQtqmWPVuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692218334; x=1692823134;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cF1BM3f2bxhcGy+lZOB+pU20s/yGXG20KfnXyoafx1I=;
 b=IBxkxEMevv9viKzzn+LIJ2ITvkXd1/I48RtABHxPTBbfUMtRtafQkDPbboZ0f2yqoJ
 7mYO2rRp6WCqqs2F6Ugzam7RV1wbWEU2Sas8A9R8C9i4MXNfA58UzJXxtt/zuYCTqic/
 Ab1OQCp4bWCqoJALXf1t/5Hf23FY2XiHDZXbOuxKwwRG3enrVjQXPOP4lWXzyZt2VBlK
 H+ytsDKqb27YrhPI/rYeNjFNqI8PMMTDDjDbVb6HKcD8b5GcxUfio6G9FYCiht83xmir
 zp3gNQREYIRrfVkdupSw7peyoCpIitMFZeL6T45NLZt7MDlP3Cl9ZzgYgypSjuGRDotO
 AYKw==
X-Gm-Message-State: AOJu0Ywz0O4bxvOX+l3a6f4e5ETNr0W3XP9NnD6LgecJ1qKMmc2+SL2V
 XA3AKM7dfYZYAH3v5d8HMtk4lw==
X-Google-Smtp-Source: AGHT+IFBs4yFI2ZdF5J+zDBYRSv/8/8CUjxCOKVwBxVARzrU7XVEhR34nZ31QOQcz8vsQ6XyltMRDA==
X-Received: by 2002:a05:6a20:938c:b0:13e:90aa:8c8b with SMTP id
 x12-20020a056a20938c00b0013e90aa8c8bmr977018pzh.4.1692218334596; 
 Wed, 16 Aug 2023 13:38:54 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 i5-20020a63bf45000000b00565cc03f150sm4165109pgo.45.2023.08.16.13.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 13:38:54 -0700 (PDT)
Date: Wed, 16 Aug 2023 13:38:53 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <202308161338.1B73172C@keescook>
References: <cover.1692208802.git.gustavoars@kernel.org>
 <087a1c335228bd245192bbb2fb347c9af1be5750.1692208802.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <087a1c335228bd245192bbb2fb347c9af1be5750.1692208802.git.gustavoars@kernel.org>
Subject: Re: [Nouveau] [PATCH 1/2][next] nouveau/svm: Replace one-element
 array with flexible-array member in struct nouveau_svm
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

On Wed, Aug 16, 2023 at 12:04:06PM -0600, Gustavo A. R. Silva wrote:
> One-element and zero-length arrays are deprecated. So, replace
> one-element array in struct nouveau_svm with flexible-array member.
> 
> This results in no differences in binary output.
> 
> Link: https://github.com/KSPP/linux/issues/338
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
