Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B455D7E4334
	for <lists+nouveau@lfdr.de>; Tue,  7 Nov 2023 16:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7E510E054;
	Tue,  7 Nov 2023 15:17:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728ED10E054
 for <nouveau@lists.freedesktop.org>; Tue,  7 Nov 2023 15:17:48 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9d216597f64so885544366b.3
 for <nouveau@lists.freedesktop.org>; Tue, 07 Nov 2023 07:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699370267; x=1699975067; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PytzvdSPNnpR71udgBfeBRoR4KeYQBs+pot/fdzukjc=;
 b=KDSIwkJe9ar2jEQakkauj6SD9Y2HFB9n56NYq221ddfE4upha05YEGpSQr6KZ2sCvy
 wCCAj8VIo9CDglca439jBszC3fisTB4P1nvC/i8vfFHnIfzGiEgidqIdF1hcPUG3mB97
 uqNSb301ubfNgbXQb4CW7iOeAoTfgFCt8/qavI3ABcWMBqizpEBpDAuF3YQBAb6cALB8
 Ux8BeZQbDwzYDG2xREP+yEWPDVKCg3vSSQaDph9LAJSnDWkup7t15hc9BYllIx6AH+on
 JLw8sPXZs2cIDz4e3RZOUEBHGnKOeCDHSZ7tiCpDf9jS3UEDytGyVzEPoiFBbIq/Jr1n
 T0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699370267; x=1699975067;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PytzvdSPNnpR71udgBfeBRoR4KeYQBs+pot/fdzukjc=;
 b=KKdX8/sKfg08Q881HoZUzRIGixznom8eOUo6Pgq3ulbYeoTeHyP+LsgBsENMvxsqb2
 cZJGHDIOMoBz09xWCg/3jS507Xwbtw1vUqvRlGvcCDYfARyr/EWCjUvRQcqTUW+opnJc
 n1DHABxp5E3f2kNF7rVhRRQVK7ssqdfzRNzxXmB24vBAVLE4WPsAwQR0cdPOitVrlE9t
 AqAK5TGqT3g0v4BI9NqoILeS4EA+/zlK4Zqzs56VxnGqrqeaBKDbpdYS1CRla7by5hzY
 r6K/FxSDEX5hU9SARFU7//gPhoeMvAsb3Y4uKAPfb9B/ffC6XFpJbY/aRoqFfD/tDG4L
 RvhA==
X-Gm-Message-State: AOJu0Ywwb0Qnyvqz68J3PpIBff81We5R3Xi3Fd/qO3su3ThFQPDoJAy9
 aHXV4truKbTLEgrP67rRwQo3ig==
X-Google-Smtp-Source: AGHT+IGGxWk0On6DQZjKTrFSAQZ1tQEdD8Os1udp0Tm//0UElKcJ4Gh8mBrUWXRfofmslwOAmL8Fnw==
X-Received: by 2002:a17:906:d797:b0:9c7:58cd:b57 with SMTP id
 pj23-20020a170906d79700b009c758cd0b57mr12485956ejb.37.1699370266770; 
 Tue, 07 Nov 2023 07:17:46 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 cb11-20020a170906a44b00b00985ed2f1584sm1133792ejb.187.2023.11.07.07.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 07:17:46 -0800 (PST)
Date: Tue, 7 Nov 2023 18:17:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Timur Tabi <ttabi@nvidia.com>
Message-ID: <f6381720-3b0b-40be-a705-0decdf0a3800@kadam.mountain>
References: <b9a97887-9b58-4518-8dd8-3865afb9279b@moroto.mountain>
 <f9a53aa8399313a323232744be57c9908f674f1b.camel@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9a53aa8399313a323232744be57c9908f674f1b.camel@nvidia.com>
Subject: Re: [Nouveau] [bug report] drm/nouveau/mmu/r535: initial support
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Nov 07, 2023 at 03:06:27PM +0000, Timur Tabi wrote:
> On Tue, 2023-11-07 at 17:32 +0300, Dan Carpenter wrote:
> >     170         ret = gf100_bar_new_(rm, device, type, inst, &bar);
> > --> 171         *pbar = bar;
> >     172         if (ret) {
> >     173                 if (!bar)
> >                             ^^^^
> > If gf100_bar_new_() fails then bar isn't initialized.  Do we really
> > need to initialize bar to NULL on error?  If so then we should do it
> > before the "rm = kzalloc()".
> 
> We can just do this:
> 
> struct nvkm_bar *bar = NULL;

I mean that will silence the warning, but why are we setting *pbar to
NULL?  If it's necessary then there is still a bug because the first
error path doesn't do it.  If not, then just do:

	ret = gf100_bar_new_(rm, device, type, inst, &bar);
	if (ret) {
		kfree(rm);
		return ret;
	}
	*pbar = bar;

It really depends on what we're doing with *pbar.  I looked at the
context before I sent the bug report and it kind of looked like this
function is dead code honestly...

regards,
dan carpenter
