Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955BE34491F
	for <lists+nouveau@lfdr.de>; Mon, 22 Mar 2021 16:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193436E4E6;
	Mon, 22 Mar 2021 15:20:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5DD6E4DE
 for <nouveau@lists.freedesktop.org>; Mon, 22 Mar 2021 15:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616426435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4v197dOC1+vP6qqqj6AZY8VlswfztiZXPmNNiaGoJ8s=;
 b=RhguzS3A/KLU7Hsrljx460wSgUoeKyerYV5aS7PCu4gbF5cfUZJkR0Dx7KLkEsuJ8T/wB/
 iFGnv81mUW+mPlOcpEkiFzlKm3x7C567lDbEjc+pLvMqYsCbQ+oksgAEOMoOQxRlv27kJC
 Y8GTUOox2IdyvfGieZocuh19RUiMyNA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-zwzkeTO3N5ibYt7Jnatd2w-1; Mon, 22 Mar 2021 11:20:32 -0400
X-MC-Unique: zwzkeTO3N5ibYt7Jnatd2w-1
Received: by mail-qv1-f71.google.com with SMTP id dz17so37277797qvb.14
 for <nouveau@lists.freedesktop.org>; Mon, 22 Mar 2021 08:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4v197dOC1+vP6qqqj6AZY8VlswfztiZXPmNNiaGoJ8s=;
 b=iNtncHFD4+WzegeRLNv1CYTqrV8KbKJBgem/3PpYKgKLNlohPcxizKG8lYM4U1IJym
 z8K7rb14ht2fgOZn+QBUIpP+u61cyHG90r9F1geBwR5otEyyuSLZucme15ewIthKMovN
 BO0hs/a6yp9YVRl4eBQWmDkdnjU9x7FnAWaLvj0JMiVzbalAAtX72XXuSMabl3SbGLah
 IiDwVwpNsNhJ1RE+vWGJ2n+FzSDb0gK9+dDTlwlmkBk3UFGKV61ABRB0ZxLd2AEHyz5j
 E13VN1TC0EN4yS180oR9jC0jca+1l3HjvhJRs7PUdVjI2lAvZ+y5JCiDmjZIH8MOfhPO
 qzZw==
X-Gm-Message-State: AOAM531j4z/+EoDr3X6ZWIzT65uzQWP5stejzOn9itCqhFXstJAekuiS
 9iVbEm7TdJ10hqzIk/SCkSxRBbmXFh/UyIl6HYQCT9+HxY3SceOu+2VcrivhlGar3TgM84AX5Ni
 vSQAR62p0xduUvdQfCFIitpCRWA==
X-Received: by 2002:a05:620a:887:: with SMTP id
 b7mr494018qka.215.1616426431931; 
 Mon, 22 Mar 2021 08:20:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyloOElPDvURGfzRBosxsOGJQAi9MOmFaXQGiGcaYAqktZymENkemaqvfoJEKxlkLC1LHr0w==
X-Received: by 2002:a05:620a:887:: with SMTP id
 b7mr494003qka.215.1616426431678; 
 Mon, 22 Mar 2021 08:20:31 -0700 (PDT)
Received: from xps13 ([2605:a601:a63d:7f01:2eff:82b1:a6fd:2aba])
 by smtp.gmail.com with ESMTPSA id h6sm8958617qtj.75.2021.03.22.08.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:20:31 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:20:29 -0400
From: Jeremy Cline <jcline@redhat.com>
To: Lyude <lyude@redhat.com>
Message-ID: <YFi1vSzOYycRRe7b@xps13>
References: <20210317224222.447100-1-lyude@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210317224222.447100-1-lyude@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH i-g-t 0/3] tests/kms_color: Fixup for nouveau
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 06:42:19PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> This patch series just introduces a small drive-by cleanup for
> kms_color, and fixes the kms_color test so that it works correctly on
> nouveau. Note that the invalid LUT/gamma tests will likely currently
> fail, but I'm going to be submitting some kernel patches to fix these in
> nouveau very shortly.
> 
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Jeremy Cline <jcline@redhat.com>
> 
> Lyude Paul (3):
>   tests/kms_color: Don't opencode igt_check_crc_equal()
>   tests/kms_color: Allow tests to run on any driver
>   tests/kms_color: Stop leaking fbs
> 
>  tests/kms_color.c        | 15 +++++++++++++--
>  tests/kms_color_helper.c |  6 ------
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 

Reviewed-by: Jeremy Cline <jcline@redhat.com>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
