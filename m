Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606003EF38C
	for <lists+nouveau@lfdr.de>; Tue, 17 Aug 2021 22:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74406E283;
	Tue, 17 Aug 2021 20:32:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891F46E2A3
 for <nouveau@lists.freedesktop.org>; Tue, 17 Aug 2021 20:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629232355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QHdS9ueOmb69jsJrcy2jnmQ7X1KObHEiLTLTlPALuPw=;
 b=guolb07ggMrskdybk3wUxukW2OKya/4zv0sVNhvM+nFXr/ARf3zVCgdfKXHuUGgfJn6KW2
 LNioo3O0txmIg9Fp+nBV4fKMsgo3qGZRzOP/B8iXbqomh9+JUKb11LoCViWENOPLQrRe7E
 44rflxvgOn/Ut7dv42+CxnliLv7va+Y=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-oIS2x0TgPsGSIhl_nHHFXA-1; Tue, 17 Aug 2021 16:32:34 -0400
X-MC-Unique: oIS2x0TgPsGSIhl_nHHFXA-1
Received: by mail-qk1-f197.google.com with SMTP id
 d202-20020a3768d3000000b003d30722c98fso121990qkc.10
 for <nouveau@lists.freedesktop.org>; Tue, 17 Aug 2021 13:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=QHdS9ueOmb69jsJrcy2jnmQ7X1KObHEiLTLTlPALuPw=;
 b=oSTGvWAMyC8AxgpZBVEArgzfkh+EKn/Jz6VLG6cGTxqHwYApPIPH6vBCYOngCJhmPe
 QLKoQ6UwGsFqPksI4SX/rp9xFIhhAV/SnW1yWTLoxnyGIT+sLQMla5ZlnRJODuRvD0gU
 G4aRSUJTnAohU6gEicFvWkJdJvCzeFdNp8AO1EXKEAF9wOigY9+MP3EWTkuF11Nr3I7h
 mYkk0umSrN5ASrgtF6GMWG6Ai47QSF6XmYBETg5bmcU3R+dD32kiUsk4MpxUNO8q0FtV
 BcA/lsz+YaVc8jvQrkybVRqooCFch19GIrWXU+9LXmswqFz874HTwuN2k3z2JJSCVeOY
 nKkw==
X-Gm-Message-State: AOAM533iE0nBJ5Vl9edo9ls/R2ODH1XBfCsHVjuRu6kauoJC7xleNGb6
 aQAzFJLxvEOG0UOKGrtnvaiFl0mBGEtRhoiqPPvgt+BG0aOelUwgS9uBoJRxju23AhxUjYjJWuM
 li3NLuo8nX3fUbK0XWk3aSbw1+g==
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr5275129qvp.12.1629232353971; 
 Tue, 17 Aug 2021 13:32:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygDhxEIqY4Za1qslzDIgx56HQC6qEhIHk2i9Emxojd0+6VzuJVx7K1EP9WMmefEySmnxy/Cg==
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr5275092qvp.12.1629232353464; 
 Tue, 17 Aug 2021 13:32:33 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id n124sm2175109qkf.119.2021.08.17.13.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 13:32:32 -0700 (PDT)
Message-ID: <418fdcbcf554d34cc6423a88974f916b64b3664c.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Jeremy Cline <jcline@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Karol
 Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Tue, 17 Aug 2021 16:32:31 -0400
In-Reply-To: <YRoN0vWFN6Lw22ej@eldamar.lan>
References: <20201103194912.184413-1-jcline@redhat.com>
 <20201125202648.5220-1-jcline@redhat.com>
 <b4da382b17a77b66e45fd374c9d806dac6054e3a.camel@redhat.com>
 <YRoN0vWFN6Lw22ej@eldamar.lan>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH v2 0/3] drm/nouveau: fix a use-after-free in
 postclose()
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

It may have been, we're in the process of trying to change around how we
currently accept nouveau patches to stop this from happening in the future.

Ben, whenever you get a moment can you take a look at this?

On Mon, 2021-08-16 at 09:03 +0200, Salvatore Bonaccorso wrote:
> Hi,
> 
> On Fri, Mar 26, 2021 at 06:00:51PM -0400, Lyude Paul wrote:
> > This patch series is:
> > 
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > 
> > Btw - in the future if you need to send a respin of multiple patches, you
> > need
> > to send it as it's own separate series instead of replying to the previous
> > one
> > (one-off respins can just be posted as replies though), otherwise
> > patchwork
> > won't pick it up
> 
> Did this patch series somehow fall through the cracks or got lost?
> 
> Regards,
> Salvatore
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

