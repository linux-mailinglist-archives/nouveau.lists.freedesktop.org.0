Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE0E41648D
	for <lists+nouveau@lfdr.de>; Thu, 23 Sep 2021 19:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261106ED98;
	Thu, 23 Sep 2021 17:41:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BE36ED98
 for <nouveau@lists.freedesktop.org>; Thu, 23 Sep 2021 17:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632418879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SmDjFJsaZCA6KWN4HS486qKHt349/F7+f0mgEgYWTjc=;
 b=NLo5wYk8+akoGlebpT6ReKvY9T3cl+wG/k5gKfvhQWS+OSAGXsnLPYMcMRMBpf44PS9nQU
 g4jQEAeKveGdqtookQ+TW0Tlc9dBOi/tzjSxLVLso18hlpiZkoKifIXMbRNixkZ/1x4FcI
 fhe83UnKypJNfBVUHRMe5pyLqft9yyU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-KjQwG-SmMECcr2tdEIotXw-1; Thu, 23 Sep 2021 13:41:18 -0400
X-MC-Unique: KjQwG-SmMECcr2tdEIotXw-1
Received: by mail-wr1-f69.google.com with SMTP id
 m1-20020a056000180100b0015e1ec30ac3so5788326wrh.8
 for <nouveau@lists.freedesktop.org>; Thu, 23 Sep 2021 10:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SmDjFJsaZCA6KWN4HS486qKHt349/F7+f0mgEgYWTjc=;
 b=T9/w6Fy6jzBwaHAW5U+bzQ3rq+IiWP25ZW6crNJ4d4mkuIgIJbJWAOpKCh/LNIoPhW
 KLw+Eimdlar24tQCgID8m20rLJSX2u16/v80LL4ASTcAWAd++rKwKjg/0u2ScFzT1KEd
 Ac4Sj+/Tq8O5T0sMLlLMk6Tlf11o+DP8KSHMFbTcTiaZh6XHb3vVICPtW63PgP5r4RwK
 vF5aZ2cEpaQsU8CjAFDLUpVSDeMaql8C3UziobBwyeJDmEP0r/ykR4HxwoupQx1f6PSR
 gle3KZ9HFLTpro6MR31cg5g6mcRd8ex3mGqipr8e7qWzvu1OaMx1oZGgNO3ONccVayUC
 ivPw==
X-Gm-Message-State: AOAM533dpV0uzSWBO4dveyV6/Be7nh5neB3bcsFNun3s6Om+LwtYDwYI
 ii6timgmmk0yv0novZ6eHWPnul6t6JotDQCttZHX0lZGznwtREG9ZKIgoRFfMXc/IcHcyn2aZgD
 6+j2B7sZJATZg6oFPXzwpT3Z7orh1dZ7B2uCVvWVREw==
X-Received: by 2002:a05:600c:4991:: with SMTP id
 h17mr17588220wmp.74.1632418876767; 
 Thu, 23 Sep 2021 10:41:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR58YifCWksEfIlo9ENLvXvdCtjvge/aoaotzcMzz/74Md4WFfXwftxwsiOhOaLEBb2oNOxywsZZR7MWvappc=
X-Received: by 2002:a05:600c:4991:: with SMTP id
 h17mr17588203wmp.74.1632418876628; 
 Thu, 23 Sep 2021 10:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAN9WMdPCd3EY866WcKoJqnx=od9pOy4k5q6HM4tsr2wrZ2ZOeQ@mail.gmail.com>
In-Reply-To: <CAN9WMdPCd3EY866WcKoJqnx=od9pOy4k5q6HM4tsr2wrZ2ZOeQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 23 Sep 2021 19:41:06 +0200
Message-ID: <CACO55ttuSOQ4mUr9pR2L15KP6qy5DuPDwz7d_eSkm_mxDEqkoA@mail.gmail.com>
To: __- -__ <isapgswell@gmail.com>
Cc: linux-bugs@nvidia.com, nouveau <nouveau@lists.freedesktop.org>, 
 Dell Tech Support <technical_support@dell.com>, ubuntu-users@lists.ubuntu.com, 
 System76 <help@system76.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] nvprime
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

If you have an issue with the Nvidia driver, ask Nvidia for help. And
don't CC random Mailing lists and spam them.

On Thu, Sep 23, 2021 at 4:32 PM __- -__ <isapgswell@gmail.com> wrote:
>
> Hi,
>
> I launch nvidia-settings; and
> I launch __NV_PRIME_RENDER_OFFLOAD=1  nvidia-settings
>
> neither
> __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia nvidia-settings
>
> Sam results
>
> Shouldn't it?
>
> nvidia-smi nothing to show
>
> aTI,
>
> L. F

