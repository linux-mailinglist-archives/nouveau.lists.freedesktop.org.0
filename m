Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DA23C4656
	for <lists+nouveau@lfdr.de>; Mon, 12 Jul 2021 11:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915ED89BF6;
	Mon, 12 Jul 2021 09:47:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1E889B49
 for <nouveau@lists.freedesktop.org>; Mon, 12 Jul 2021 09:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626083241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OsAxr7I5wY3GHXnm0dzu227J/w3T3hi+AUx2iyLrph4=;
 b=YRjKJ050sf3F5FYwrAj4EsxK1p9pnQ+stwJCtRKqrkmmZWFZPmGwGpsrjFbZgSE+8g1P6U
 etBradPyuKnnTOzTVaGLaatuxPF/oK++v6DytXQGIIOhnZC7YWbT82u1QKJAb9ohF/0kck
 oF+l8v3XSSLwXSILBooAuLallhI9Qak=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-oZegqMxTMKGm-MyVpTEfEQ-1; Mon, 12 Jul 2021 05:47:20 -0400
X-MC-Unique: oZegqMxTMKGm-MyVpTEfEQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h11-20020adffa8b0000b029013a357d7bdcso6553886wrr.18
 for <nouveau@lists.freedesktop.org>; Mon, 12 Jul 2021 02:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OsAxr7I5wY3GHXnm0dzu227J/w3T3hi+AUx2iyLrph4=;
 b=cjostzMN2Sn5MloDDH2qRWAa3DYLBi3/lknXA9GE2VxBl75rlbXeyctw9J0/LZ8oE0
 +WoPo+a3Jg8F2kUzCcApXv5CvJvL8MtJRc/8kipD4YbZ5CQxKUBUsJIvAGU25P7c9dQ2
 GPmIktzDFgRCiznHIMELL1I+kk1ZX7TvIVPxDWeKivE+RsSn0oWYkRIkeLNyGy41xY0e
 pV28tdQReBycRtPkMGo6cE2ohXhwJxp5HcQRs3MmLkjxYB4O2Gn0a8sO9p6Fy2zBkRqy
 cQpEW+WzWe6AalFklo5GNcN6+TLGutfaQ25wwmrb+TZiBwrZ4aSaNkjOSrZ1HcNAfIrv
 sJyg==
X-Gm-Message-State: AOAM532h6nvxM7O/R9NPlP/h6g2iUxRN7ZDGMO21JAxAgoEJ54jRIsPt
 WV70mrZb8bTEgpY+pBPRCzs0OpHpVpkjk89hLyE2d/3w80sc09xT5gmXB93BnOmR0W2fBmkHXLG
 4bontOLoiJhaDE5tNamMIZtUn9McJt09CBzKKVJtOTg==
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr23662121wrn.113.1626083239347; 
 Mon, 12 Jul 2021 02:47:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3sW8UYSOM/Q6qgJACh2S4VICMKyF4ZwsV6v+fR4fftaOEQT2tUBbmhmNCwT2qSaSR3qFgvPBKqWkCA/b7Jp8=
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr23662105wrn.113.1626083239204; 
 Mon, 12 Jul 2021 02:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210703072502.646239-1-gushengxian507419@gmail.com>
 <anhfX5shNJsdNd6vWMeQqNTawyT0AGuoZYI7yRItB-il7fywDu9_Ie1kKL7Wwv2ecVxiYaoymsZHpufnuxUBqvja2uq0_t-Qmhhc4uHT5f0=@emersion.fr>
In-Reply-To: <anhfX5shNJsdNd6vWMeQqNTawyT0AGuoZYI7yRItB-il7fywDu9_Ie1kKL7Wwv2ecVxiYaoymsZHpufnuxUBqvja2uq0_t-Qmhhc4uHT5f0=@emersion.fr>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 12 Jul 2021 11:47:08 +0200
Message-ID: <CACO55tvmvcrAHjFjJ9fMgcFspyfMLE2gR7f3Fxe0_cxxrfwaUg@mail.gmail.com>
To: Simon Ser <contact@emersion.fr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] include/uapi/drm: fix spelling mistakes in
 header files
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 gushengxian <gushengxian507419@gmail.com>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 gushengxian <gushengxian@yulong.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Jul 3, 2021 at 11:00 AM Simon Ser <contact@emersion.fr> wrote:
>
> Reviewed-by: Simon Ser <contact@emersion.fr>
>
> But this this touches a lot of different drivers, not sure we can just
> merge this via drm-misc-next?
>
> In any case, please ping me again in a week if this hasn't been merged
> by then.
>

As long as it doesn't touch code I don't see why not. Just in case:
Reviewed-by: Karol Herbst <kherbst@redhat.com>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
