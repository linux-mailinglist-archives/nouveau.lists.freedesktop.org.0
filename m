Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D2F34E318
	for <lists+nouveau@lfdr.de>; Tue, 30 Mar 2021 10:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451466E879;
	Tue, 30 Mar 2021 08:25:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEEE6E879
 for <nouveau@lists.freedesktop.org>; Tue, 30 Mar 2021 08:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617092699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b5Rr58Hbc63Cgp3a6e/yK918318YTg4gYMgJF0Ngs9w=;
 b=TjyepuBWJbG7dKedFJ35Ot7y8Dw8KMkTHP6iygJf17inF1BVn+zJPYoCY+LqEpO0V7fNEZ
 nHJOz8ZBtS9bMotGQwUgW4F5Zkv/pEYVL8STq1aD7w2t4ZxspMKn3h+MRUAHlbFRXZ28oN
 0YyFW0ytUx9i2JK5TvpvGR1o5DHtirY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-CV9dBgiDO2SVp9xS_EqIyQ-1; Tue, 30 Mar 2021 04:24:54 -0400
X-MC-Unique: CV9dBgiDO2SVp9xS_EqIyQ-1
Received: by mail-wm1-f70.google.com with SMTP id a63so243019wmd.8
 for <Nouveau@lists.freedesktop.org>; Tue, 30 Mar 2021 01:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b5Rr58Hbc63Cgp3a6e/yK918318YTg4gYMgJF0Ngs9w=;
 b=V833Vq/5A42JBQiW8wJ04ZtWtUyAAdm8BBjDgmblFRkDYTLhDw8usuX7WeQtvlCddZ
 htJ5+CwiDoJoiez/dPW7b6Z9kkgbxPzudrJ/HbxP5SuGV0Pvp7a7fiFnLAtp4tOVEV7G
 t8b+ko0nufrQbB8YPtlLg7qlhX29TDstMiuYvLCeA779hptethpBCjsGAUTuaIq4tdez
 YSblQpBLyfOqAg8O5P3Ep/OxjdNGWxMDCku+sn1Ho0XQ5uHaAIr8I64LrHoQGcHJZqkV
 eFnz6aPaztWRJHhbSTvVthS41p2bDGGLdIEwg0YVPi9LsRoSidNjxtH/+XB36/IpUilh
 XgVA==
X-Gm-Message-State: AOAM532SOPxiPlMerPCkbC4Zf/ZD/oOcIcrQZKoWKYW2TpQrlQDXHgBx
 pBXp2CS8bpMiwrF1QvB/K5ZLN769YPPACHVGb4jKQ2fhqQAePg3VTXFadruHHPEPsDsUc86KNoh
 C5RBLMZNLmM4Dw1VcipL3pHZH1AMW/QRuH6dQgB4vjA==
X-Received: by 2002:a1c:e184:: with SMTP id y126mr2785669wmg.163.1617092692840; 
 Tue, 30 Mar 2021 01:24:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw09dZAHnan2rZojxHuI26bfN6xik5M0Oec6prQi3TzKIztSEtiG1hTiDLJPuV4jsLgoiLf9/Bi6Ld87Wn3EwA=
X-Received: by 2002:a1c:e184:: with SMTP id y126mr2785648wmg.163.1617092692644; 
 Tue, 30 Mar 2021 01:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <AM5PR0201MB23868ACFBFA07B794174E1DCB57D9@AM5PR0201MB2386.eurprd02.prod.outlook.com>
In-Reply-To: <AM5PR0201MB23868ACFBFA07B794174E1DCB57D9@AM5PR0201MB2386.eurprd02.prod.outlook.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 30 Mar 2021 10:24:42 +0200
Message-ID: <CACO55ttjWMnSgF9gEtCFH9NU+X=-62gbmmYbawtJeUjGDunBCw@mail.gmail.com>
To: georges1897@outlook.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] SLI support for nv44
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
Cc: nouveau <Nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Mar 30, 2021 at 8:28 AM <georges1897@outlook.com> wrote:
>
> Hi,
> I am currently the happy owner of a nforce 4 - SLI with two 7100gs graphics cards setup.
> Since I've read on your features matrix that such a setup is rather uncommon among developers, I would like to help you implementing SLI for old GeForce cards as much as I can. The lack of support for newer kernels from Nvidia has indeed made my system obsolete (I do encounter graphical glitches with many DEs).
> I can run tests with my hardware, try new drivers, and know the basics of C programming if necessary.
>
> If you think that I could be helpful in any way, don't hesitate to contact me back.
>

well, SLI is really low priority, so unless somebody is willing to
reverse engineer the nvidia driver and implement the code in nouveau,
I highly doubt there will be any progress on SLI in the near or far
future. So if you want to help out, you'd do the full thing as there
is nobody working on SLI. Some bits might already be reverse
engineered though.

> Best regards
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
