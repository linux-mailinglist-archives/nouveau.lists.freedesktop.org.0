Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821AD3CFB2A
	for <lists+nouveau@lfdr.de>; Tue, 20 Jul 2021 15:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEF189DBD;
	Tue, 20 Jul 2021 13:50:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E7089DB2
 for <nouveau@lists.freedesktop.org>; Tue, 20 Jul 2021 13:50:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id m2so26126496wrq.2
 for <nouveau@lists.freedesktop.org>; Tue, 20 Jul 2021 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=sI4lOFqRzupKkYq98Gmd5BUFkdbcZOoG/UvAcZHjLDY=;
 b=QBbwhpFEg138cFF13OlHokR7JOS4muXESJoP0GE8o7KEv35eNms/xuto9Ggx61MJnV
 pv5yMUhlTXtwC0gs7+LZigEVtzx6FeEYFBjFZISkgcMiS1iksMJxxE9AQ75qX/XxMULb
 sMeC2UURwOTw9xD6wYT2FjKji3DINZHhYE1LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sI4lOFqRzupKkYq98Gmd5BUFkdbcZOoG/UvAcZHjLDY=;
 b=CUHEDZMeUMiKUjEM8s1fWDR8DmmMqRA3QOHcep4YkWSEgPykwVOOCDHmja89Q45Mm4
 d+w1ZQGTAeLe3S3iHo0+ZAMg0dqufatKeNj34cXIvoRmQTxvcRaitWSy6lXI+nqnOGNP
 LfFcd9h/Y9ZrTOsdnBNo0HHfcbhrQ9kjlKAw+Aq56Wwi6VF+MqCpq7qQH4JAzSkSnAkD
 Gth6d9QY1DbNKUhZ04qrq0s+6EvTXTzKRi7TOgorPBu6+vxxM5KpXGwBoKWBCdDHi7ic
 jbFoX5g6d5YHsKKcONFfbG8p+csJlcfYyqUT2443LlXzpVdX9Ltnu5fQj6G0rWdkabwj
 eEQg==
X-Gm-Message-State: AOAM531eXfHfTLCVpjzaw06FW0MZZpEcmsS8N2ZiD8Z4A5hBMZWUTWIa
 8shi6AIj1Qm3Q69bp1mb0Trskw==
X-Google-Smtp-Source: ABdhPJxQV3Ee2pwcwbIe/vS8ucyfghhnzHjKP4KrgLfr14bAgT3gr9xSuwjFXjaR+rGwh3KUvvzTOA==
X-Received: by 2002:adf:c803:: with SMTP id d3mr30463317wrh.345.1626789055598; 
 Tue, 20 Jul 2021 06:50:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f2sm23731613wrq.69.2021.07.20.06.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:50:54 -0700 (PDT)
Date: Tue, 20 Jul 2021 15:50:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Message-ID: <YPbUvIYmu3WfyM2C@phenom.ffwll.local>
References: <20210716061634.2446357-1-hch@lst.de>
 <20210716061634.2446357-2-hch@lst.de>
 <f171831b-3281-5a5a-04d3-2d69cb77f1a2@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f171831b-3281-5a5a-04d3-2d69cb77f1a2@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Subject: Re: [Nouveau] [PATCH 1/7] vgaarb: remove VGA_DEFAULT_DEVICE
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 09:14:02AM +0200, Christian K=F6nig wrote:
> Am 16.07.21 um 08:16 schrieb Christoph Hellwig:
> > The define is entirely unused.
> > =

> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> =

> I'm not an expert for this particular code, but at least of hand everythi=
ng
> you do here makes totally sense.
> =

> Whole series is Acked-by: Christian K=F6nig <christian.koenig@amd.com>

Care to also push this into drm-misc-next since you looked already?
-Daniel

> =

> Regards,
> Christian.
> =

> > ---
> >   include/linux/vgaarb.h | 6 ------
> >   1 file changed, 6 deletions(-)
> > =

> > diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
> > index dc6ddce92066..26ec8a057d2a 100644
> > --- a/include/linux/vgaarb.h
> > +++ b/include/linux/vgaarb.h
> > @@ -42,12 +42,6 @@
> >   #define VGA_RSRC_NORMAL_IO     0x04
> >   #define VGA_RSRC_NORMAL_MEM    0x08
> > -/* Passing that instead of a pci_dev to use the system "default"
> > - * device, that is the one used by vgacon. Archs will probably
> > - * have to provide their own vga_default_device();
> > - */
> > -#define VGA_DEFAULT_DEVICE     (NULL)
> > -
> >   struct pci_dev;
> >   /* For use by clients */
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
