Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B36C79AA12
	for <lists+nouveau@lfdr.de>; Mon, 11 Sep 2023 18:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79D110E32E;
	Mon, 11 Sep 2023 16:17:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4B310E32E
 for <nouveau@lists.freedesktop.org>; Mon, 11 Sep 2023 16:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694449028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lAgyEv8v84Vh6tDzXDpI5U6AfJ7ln7UC0vFeWtEv4VA=;
 b=CjK71LnI950zO9BcUM1q2faJgwa21huKiEo3zxXJcjMtUZA+VGUgO/mkBs4diASju3Bi1+
 TQwi9jm7cwCGICeD/xmWu8rWG/MjMJ/UPr3Ly+Hlks10Ji7hjoQUQygS/OkPsOUdNm5jIG
 ol5Grn4v0moNkQkv0Din9DQrU9PmOf8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-xltkxITmPf-CJKnRgpP0nA-1; Mon, 11 Sep 2023 12:17:02 -0400
X-MC-Unique: xltkxITmPf-CJKnRgpP0nA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-500b5641eeaso4933376e87.3
 for <nouveau@lists.freedesktop.org>; Mon, 11 Sep 2023 09:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694449021; x=1695053821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lAgyEv8v84Vh6tDzXDpI5U6AfJ7ln7UC0vFeWtEv4VA=;
 b=UxBnhWHBS+NKbfKHqzAsSaoeEANBeh3t/GXRqiTEEXqdZ/EmWboCgCcIWCUiGPMKNG
 skHC2lRm6O2uJ2QGuaer5LnkaduqONS/2slaoIIzWuuf77RuvqpZgENb+hSHNsomKLv8
 sZgaFNxHklcDy1Fn378cdJijSQHbhowBFlt1xjDh9D4a+HwSHrSbhoABgfGKbpf1SSsU
 HqSGd/yG7BlsFvcqfkmBtPdOFdY3BEtU/MT3/NRl4j7+PqTXTMZou8idvt9+3u/kIXVM
 lbe8+fqTDCP4ommgf0+gPVyF0pfGBvOQrIsOvhGiu0eVAch0JEVFLOb8TyPqiietiXHp
 WhxQ==
X-Gm-Message-State: AOJu0YyDFz0waojpew1UHkAW4LGUFIeGYCVq1FuCzB2KP9B8vFpSpOJj
 eqwUmNCpQELgfik8RLtLpR3tmv/G0pqdJkShRdHhF7hyQiXaZ11t+wNiyyWBcwhgQTerJxWfxXL
 98bzlmqBtyBQMir1ZIl4P4LrkZA==
X-Received: by 2002:a05:6512:ad3:b0:4fb:745e:dd01 with SMTP id
 n19-20020a0565120ad300b004fb745edd01mr8799044lfu.45.1694449021281; 
 Mon, 11 Sep 2023 09:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFT/b800+k5rxjo807GRz9nrW77AzB8A8eqobtwbZiaP3UyedgpDYvLTqnvwcN3x2j75AAdQ==
X-Received: by 2002:a05:6512:ad3:b0:4fb:745e:dd01 with SMTP id
 n19-20020a0565120ad300b004fb745edd01mr8799026lfu.45.1694449020980; 
 Mon, 11 Sep 2023 09:17:00 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 bm5-20020a0564020b0500b0052e7e1931e2sm4801801edb.57.2023.09.11.09.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 09:17:00 -0700 (PDT)
Date: Mon, 11 Sep 2023 18:16:58 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Message-ID: <ZP89eqnqPdvlDoZg@cassiopeiae>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-5-dakr@redhat.com>
 <20230911140035.06159577@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230911140035.06159577@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH drm-misc-next v3 4/7] drm/gpuvm: common
 dma-resv per struct drm_gpuvm
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, daniel@ffwll.ch, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 02:00:35PM +0200, Boris Brezillon wrote:
> On Sat,  9 Sep 2023 17:31:11 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > @@ -240,9 +240,22 @@ struct drm_gpuvm {
> >  	 * @ops: &drm_gpuvm_ops providing the split/merge steps to drivers
> >  	 */
> >  	const struct drm_gpuvm_ops *ops;
> > +
> > +	/**
> > +	 * @d_obj: Dummy GEM object; used internally to pass the GPU VMs
> > +	 * dma-resv to &drm_exec.
> > +	 */
> > +	struct drm_gem_object d_obj;
> > +
> > +	/**
> > +	 * @resv: the &dma_resv for &drm_gem_objects mapped in this GPU VA
> > +	 * space
> > +	 */
> > +	struct dma_resv *resv;
> 
> Hm, I'd be tempted to drop this field and add a drm_gpuvm_resv() helper
> returning vm->d_obj.resv;

Makes sense, will do that for V4.

> 
> >  };
> 

