Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 494CF2E95B4
	for <lists+nouveau@lfdr.de>; Mon,  4 Jan 2021 14:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365A689F3C;
	Mon,  4 Jan 2021 13:18:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9A089F3C
 for <nouveau@lists.freedesktop.org>; Mon,  4 Jan 2021 13:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609766318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a3I82fJkh9puw9zuTg6eYXHM2hTkFtTKuI2HS9Wln3A=;
 b=hG3+0I7mBcgTI6aG9UT5f/klp5xN9+ekQUrp6nxyemL2odHtwYkcN5DcEP3OxPFvJQoiup
 eCr8MZ6tFAGdHPDyVwBBhi2/0p3+y8w1wC+/GsKbDJ6mV7wv0htyepYS1nK0ytFPd/Fyju
 sJqszHf7FgOOlMrxbtouPzNa13Cfp/A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-7L4k08_MNlSVypFIZEF21g-1; Mon, 04 Jan 2021 08:18:35 -0500
X-MC-Unique: 7L4k08_MNlSVypFIZEF21g-1
Received: by mail-wr1-f70.google.com with SMTP id r11so13230694wrs.23
 for <nouveau@lists.freedesktop.org>; Mon, 04 Jan 2021 05:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a3I82fJkh9puw9zuTg6eYXHM2hTkFtTKuI2HS9Wln3A=;
 b=lbGS5weWOvyCbtpGEOYKcetP0UB67GwfetEA8Ln95XD8LV0HDBh0n1RLCU/7CyNgGX
 FSOMPoA1lww4Gs8RtLl3Srnp3+uLJkARSg+NOa1RT23uD0Ku3iGoElt+dns48KXwH5ZB
 YgXII69pUtTuo+k7BnbiLa/UtP2Nbar3Z3bHQDEm1/hWAvGeZj84H5cAJT0l8cCCFXCS
 D6LqUOklAlOxhnV6AGYerYKonaj1q0/kgnA4rINfpA99tkA2SlkvSeB49/lLxa4wP02p
 /D+tRthNhXHmWZf+ELwh3JZUnbn4+4uFo/MU80/vhS0P74H1zEXVnev2LoBXU3+s+wAT
 Qq6w==
X-Gm-Message-State: AOAM531RwkemkxYedj717Pse3RwUpNPWdda7m8xuomY7Jkt1EYg9R+Jd
 +5DAPyNvjFaRvgkwrFKWc3udVaWhxK2V8cIn99k5sqEo6ugtOy5zpeaMn5X4dT9rhIbJ+nDYzd1
 DFUsisOFkfmYvE9gkg7+UE9XJx2QsyQoR/NUxGq9ZEw==
X-Received: by 2002:a7b:c052:: with SMTP id u18mr26487358wmc.139.1609766313990; 
 Mon, 04 Jan 2021 05:18:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxWpG9KnQ61plfeeeqd34twLFeIHd+7Kv6uiYm8LaGLDJuEgK7oOn9CKu/xVagw92nBhyiiWtg1sfQcP+JhHo=
X-Received: by 2002:a7b:c052:: with SMTP id u18mr26487347wmc.139.1609766313826; 
 Mon, 04 Jan 2021 05:18:33 -0800 (PST)
MIME-Version: 1.0
References: <CAL_w6bPog2DavwTb08AVazC9X=VD5povvP8Xbfej9PAK5gFG0A@mail.gmail.com>
In-Reply-To: <CAL_w6bPog2DavwTb08AVazC9X=VD5povvP8Xbfej9PAK5gFG0A@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 4 Jan 2021 14:18:23 +0100
Message-ID: <CACO55ts8K1e=H4X3XjGQwNVM=6Hv+sJEG7iGHfuyETaa=wViHg@mail.gmail.com>
To: Nikunj goyal <nikunjgoyal31@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] Xorg evoc
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
Cc: nouveau <nouveau@lists.freedesktop.org>, xorg@lists.x.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

uhm.. good question, but I think so. Might be best to ask on the xorg ML as well

On Mon, Dec 21, 2020 at 2:10 PM Nikunj goyal <nikunjgoyal31@gmail.com> wrote:
>
> Hi everyone,
> I was surfing the web and i came across this program endless summer of code by Xorg and wanted to ask if it is still active?
> Thanks
>
> Regards
> Nikunj goyal
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
