Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F87668745
	for <lists+nouveau@lfdr.de>; Thu, 12 Jan 2023 23:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8475F10E958;
	Thu, 12 Jan 2023 22:49:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C39110E952
 for <nouveau@lists.freedesktop.org>; Thu, 12 Jan 2023 22:49:36 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id 200so8729992pfx.7
 for <nouveau@lists.freedesktop.org>; Thu, 12 Jan 2023 14:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SWHx2ArszmWOMvOmL9HMTqeLRyXml8x4aecIK4J1xfM=;
 b=T2d6xQChtkuCRaI870QbrNhFwwVCxfB/ltmBQERjU/+oJfBXhY/cz1RHeYyjIdraiI
 0RZZ1XMlhfo7B3NY4rKRaaxKLRWCZVgiVPgtgr17CgwOgHSIpYEu4zv+lpmlbvU88r6e
 jK9fILTLJRz6ovtajskEvsL9o5FUM/PTks/iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SWHx2ArszmWOMvOmL9HMTqeLRyXml8x4aecIK4J1xfM=;
 b=EnJAE2j3XHmYB8doBDJghDKd7Mg1WUdTq6eqmQw9RlSZUHcRFnP2TXySsoraXVxtQW
 17g6WeaURr0xBxat6JSid4TBax2dLHn0YofBm75EuvhY+Vapa8UuszI1EVnFNAxW6X28
 wLv9ki05SOPkzoPHZqBzVKQvWbapWtW1fdDA3ndsxqMlam46RGPJ1E5EdLXXUabTGLiV
 AMYp5Nav06WF4d/Kblmvxrn1kdVj0jQ/QoAgcM1QbVx/kFNDGtXHXxiNQneBJbMeEDdO
 t/xyuRd/IaKfeWkPMja+u+8k75K6pbZFrT0idcoIb2P4Y9Vq/a9tWREVW7Y+5kM6hkPh
 YZdw==
X-Gm-Message-State: AFqh2krRUma/8KssKHyDFc6ojo+xwd8x/9X3n3e19qe1PwX1o0SKnPR1
 OmGupxM+WSqdjPlKfqYVhsF+RQ==
X-Google-Smtp-Source: AMrXdXtrkkqEGE9cFZZR5OGma23Ht+dZor8UGc1LpcFDNVZF1aHL808lC/1ioJhhRsAmf4y/+tUmZw==
X-Received: by 2002:aa7:99c4:0:b0:589:69ec:c6bc with SMTP id
 v4-20020aa799c4000000b0058969ecc6bcmr8245382pfi.21.1673563775884; 
 Thu, 12 Jan 2023 14:49:35 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 x14-20020aa79a4e000000b005811c421e6csm12220412pfj.162.2023.01.12.14.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 14:49:35 -0800 (PST)
Date: Thu, 12 Jan 2023 14:49:34 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <202301121449.EE489AA@keescook>
References: <Y7zB0q2pr7lEpHGs@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7zB0q2pr7lEpHGs@work>
Subject: Re: [Nouveau] [PATCH][next] drm/nouveau/nvkm: Replace zero-length
 array with flexible-array member
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

On Mon, Jan 09, 2023 at 07:39:30PM -0600, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated[1] and we are moving towards
> adopting C99 flexible-array members instead. So, replace zero-length
> array declaration in struct nvfw_hs_load_header_v2 with flex-array
> member.
> 
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [2].
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays [1]
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [2]
> Link: https://github.com/KSPP/linux/issues/78
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
