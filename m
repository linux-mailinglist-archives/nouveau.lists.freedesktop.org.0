Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0162C358CF5
	for <lists+nouveau@lfdr.de>; Thu,  8 Apr 2021 20:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F37A6E323;
	Thu,  8 Apr 2021 18:51:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB356E321
 for <nouveau@lists.freedesktop.org>; Thu,  8 Apr 2021 18:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617907906;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BD/3IJ//4IbIiQsBvvArASrfK6cu+iAAJOBJpUvbC/A=;
 b=DWxm99yvMg88z4vNMmAGSjpJTcxX4/vqK2NBFBIiwz0bPtjvLKdskHKDfAcST8qUNLvcM0
 mQM/NZG0e7BUtB9c0c27OLn6GTlaKNztKhxp8faNtibH9lEjnidHiOJ+N6o5X6/NUxRtd8
 1Qv6nynZedB61kgDdwj7t5Ti0kf+wLI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-qabeCeS6NAqRxGYOoerOWg-1; Thu, 08 Apr 2021 14:51:44 -0400
X-MC-Unique: qabeCeS6NAqRxGYOoerOWg-1
Received: by mail-qv1-f72.google.com with SMTP id bx8so1715622qvb.13
 for <nouveau@lists.freedesktop.org>; Thu, 08 Apr 2021 11:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=BD/3IJ//4IbIiQsBvvArASrfK6cu+iAAJOBJpUvbC/A=;
 b=pgmXtEpaKhyq4CaeCA5NQN7i6OeV/3QYkdoiY3vF6ojHfoSBAW2Uj+KyBMIsvOOG9z
 j5V4ZqNqmW38IyLAbVZwkyTNiQ2iYLtT22gR6IPpqxAV+Tn5t0aZvNa0kge3On8lM1Zd
 Fert1vWFl4vaxFx7dJAmZNangTc3oPXqqgC7A6BhIYuzPLxBNypYiZFK5uQFBuR8Py+Q
 hO3o3cnby/Qz95eiOviEGfyzRs0qBZ1D5iUl7cXMmC9fgjmff/e99n3rYObvRV7XnsXc
 z4MZXUxEnuST2lBgAEMxWZQlpRfIXpwsBj5IsU+RDcyaUPReJVX3FqWQZfCL5wAAQesN
 IFqA==
X-Gm-Message-State: AOAM533ri1daMEgwTXXQPrdUp78ieCGT4PZVvU2uPy/NLRm9AOvZZdMQ
 9tK1+mmHMpR4D/AuxuaSzS8ggr6tCgbSYw55Np2RiuJqNfYa3QyVSSRfYc2G8e6yaCgSfBjS3St
 JX/TvFv4M8W0GsMTN7VQ8CTrpbw==
X-Received: by 2002:a05:6214:204:: with SMTP id
 i4mr10502063qvt.47.1617907904507; 
 Thu, 08 Apr 2021 11:51:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrMnVVlxnhuJ6a9rN/xNvll03hc+4P139kmw6bFat7NGytQIf28KfBPqtGSmUXky694Mxo+A==
X-Received: by 2002:a05:6214:204:: with SMTP id
 i4mr10502051qvt.47.1617907904388; 
 Thu, 08 Apr 2021 11:51:44 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id y9sm235018qtf.58.2021.04.08.11.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 11:51:43 -0700 (PDT)
Message-ID: <893131fcec2cd4d85d840439ddc2f2899f412f1c.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 08 Apr 2021 14:51:43 -0400
In-Reply-To: <87zgy9hvvv.fsf@intel.com>
References: <20210326203807.105754-1-lyude@redhat.com>
 <87blaym8by.fsf@intel.com> <YG7fz5UmK/SaoY/U@phenom.ffwll.local>
 <87zgy9hvvv.fsf@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [Intel-gfx] [PATCH v2 00/20] drm: Use new DRM printk
 funcs (like drm_dbg_*()) in DP helpers
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
Reply-To: lyude@redhat.com
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

JFYI too - there was a legitimate looking CI failure on intel with this series,
so don't be surprised if I have to respin a patch or two (I should be able to
get it asap as I finally just cleared most of the stuff on my plate off for a
while)

On Thu, 2021-04-08 at 14:13 +0300, Jani Nikula wrote:
> On Thu, 08 Apr 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> > I think Dave caught up on pulls to drm-next, so after a backmerge of that
> > to drm-misc-next I think should be all fine to apply directly, no need for
> > topic branch.
> 
> Yup. We've done the backmerges to drm-intel-next and drm-intel-gt-next,
> and are all in sync, it's only the drm-next -> drm-misc-next backmerge
> that's still needed.
> 
> BR,
> Jani.
> 

-- 
Sincerely,
   Lyude Paul (she/her)
   Software Engineer at Red Hat
   
Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to check
on my status. I don't bite!

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
