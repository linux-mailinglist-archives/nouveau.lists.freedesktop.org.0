Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E96EF66C26B
	for <lists+nouveau@lfdr.de>; Mon, 16 Jan 2023 15:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FED710E44D;
	Mon, 16 Jan 2023 14:41:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BE910E44D
 for <nouveau@lists.freedesktop.org>; Mon, 16 Jan 2023 14:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673880103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NOdvTIf1x9tQkJ1orPjPgaQ6ppXgSvc8Pon55J0dM/o=;
 b=h6BpwuVnDAj/m1HKKGRIYV13TK1ZazKwRMVE58UgX8Z2J1vPigDjHTtnq58KjXitKg2kXG
 CVfvBCtTTRzlIe18vFK+Usn3m/lm9jqRE3KEsE9ZqLGnDiGNOgWobubDRs803CxPzOcZS8
 CM26zgjaGtSgrgv7ibehLvRpQLhECN8=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-411-eQIhcwxqNv6TdeB5yQvwig-1; Mon, 16 Jan 2023 09:41:42 -0500
X-MC-Unique: eQIhcwxqNv6TdeB5yQvwig-1
Received: by mail-lj1-f200.google.com with SMTP id
 a31-20020a2ebe9f000000b0028b64076c42so2349909ljr.22
 for <nouveau@lists.freedesktop.org>; Mon, 16 Jan 2023 06:41:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NOdvTIf1x9tQkJ1orPjPgaQ6ppXgSvc8Pon55J0dM/o=;
 b=ierPK45KLTxQw2A5Za3brcCzFwhdceBmE38dlGx8kjOUhFsiNKYHAbkxuOEb98U5AU
 VtYpjnXGelCF2y+TyqQHq6mPlXWJTN43eMLOPYiw6yvaYdbILVYwoHJhs64g1B7T8iGc
 iGgLQfrqnWqmab9s4EvdkiIszOHVEy6CGXUuiifzRCMWFNw9krJUhlSz1T+Eya6hRoHC
 DrIMyeeQ+Pf6C0sOQAdfxEbX2/kCFfhnaJ2W7FqVVflsSEjYt/XX8JzNZ97wWk5Tut4L
 7ZawRF1B6mLeK1JqHxZ7wjRw6nRVE3Md+KnJycep8JDvSJJg1NiwRCvTfybqULwOXJC6
 zEfw==
X-Gm-Message-State: AFqh2krNOT/Pn8k+40zxyDWMfkNSHfE+i/KGEUBwAonJIodyjQalJYNd
 3Z8303VNDNIhA1CruyAyHSUiJNeQiyHsAqesploDWC7RWJSUYfnBQRN4lSIZZajueqP9Le4nW9d
 ob+4lyqCrezuoXR08gRBoO/rHOjFN5pBrG9k/GzLLzw==
X-Received: by 2002:a2e:a278:0:b0:276:4462:2d20 with SMTP id
 k24-20020a2ea278000000b0027644622d20mr2384ljm.19.1673880101123; 
 Mon, 16 Jan 2023 06:41:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt9sY30K02/f5zO7kr1kC+X6IUBM2xn7/y8ozy2/Ri3RfIQeuDJUUrDrh1bQKXOq8bdG47xKQOTvByre+UJEzQ=
X-Received: by 2002:a2e:a278:0:b0:276:4462:2d20 with SMTP id
 k24-20020a2ea278000000b0027644622d20mr2374ljm.19.1673880100820; Mon, 16 Jan
 2023 06:41:40 -0800 (PST)
MIME-Version: 1.0
References: <Y7zB0q2pr7lEpHGs@work> <202301121449.EE489AA@keescook>
In-Reply-To: <202301121449.EE489AA@keescook>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 16 Jan 2023 15:41:29 +0100
Message-ID: <CACO55ttCY1KbqWqzGS1adrJno6kUs7b5_QY7X1AE6qYUqztWNQ@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: nouveau@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-hardening@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

will push in a moment

On Thu, Jan 12, 2023 at 11:49 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Jan 09, 2023 at 07:39:30PM -0600, Gustavo A. R. Silva wrote:
> > Zero-length arrays are deprecated[1] and we are moving towards
> > adopting C99 flexible-array members instead. So, replace zero-length
> > array declaration in struct nvfw_hs_load_header_v2 with flex-array
> > member.
> >
> > This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> > routines on memcpy() and help us make progress towards globally
> > enabling -fstrict-flex-arrays=3 [2].
> >
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays [1]
> > Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [2]
> > Link: https://github.com/KSPP/linux/issues/78
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook
>

