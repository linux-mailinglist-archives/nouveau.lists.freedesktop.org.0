Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531417E513D
	for <lists+nouveau@lfdr.de>; Wed,  8 Nov 2023 08:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E596D10E710;
	Wed,  8 Nov 2023 07:40:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C91D10E70F
 for <nouveau@lists.freedesktop.org>; Wed,  8 Nov 2023 07:40:30 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9dd5879a126so752062166b.3
 for <nouveau@lists.freedesktop.org>; Tue, 07 Nov 2023 23:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699429228; x=1700034028; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=goqM470Ybye323CvgNw2keEHh+SueL+mND7QToYLqaU=;
 b=O3q+ep6ozES+tWoLPErH9GTafItcRDNjhaAODoUt78dLsRIV/Xxgf0I/2zm3N2eFou
 pGYJQNNrwGnFC9mUtTN9r4m1VXjifw4ZacvJozGSo1AJyoKc9i84+XkNjhgC25XPcdBC
 GChTZMUJmooEaEvd4IBRdJMy+VUtvSbFagJAMzJBCJ6nlSdD8XNsZ8Qw+ZKGR56yiRc+
 fUCDrslfbH9l/ck/ijqWu4O5UZ+uQ+UCoUlWEXsGqLi1+D9uHHHSEfisF/sLh2Lzgtvu
 9jzASmXFG52gOt5TpkKCgJB/WrdX0eMeujFnD3fwS1A4ax5jWL38I1MLjjReEEgFKDON
 oqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699429228; x=1700034028;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=goqM470Ybye323CvgNw2keEHh+SueL+mND7QToYLqaU=;
 b=sWoeYvkkecKNS8afFZ9JMqOYOOFXMuARi4tgi3GspznBW+ZbEG5IMnVAEqO84MXK9j
 /w8miXUKS6uS/Nn2Wzz549jqZ3Ago40k0uLVI9sjuxMxWqLw2+0RYUbHESIweTbFiWx6
 C0ZkKMiYKkYjHHJ84zQJIZ2Lz9svgxu5FkDSxD89erNyB0XRZRstqmSvbkdS1nbmpkv8
 mJdtVOxcEkdqtzxkZxQkxfQUFKV4RkcdKBQWiXclS1BlZxukRtklCkPCptO7eHrEHgtR
 UUcoSBJbJxShZpRkv5aOjupUKdgj9D0ApWEeyrQJELtdPTjYvUMjk43Gdx6kVn1QZqvi
 LD6Q==
X-Gm-Message-State: AOJu0YxzSzUZ2wQnRCEikA01n7myNhWpJ+77lA0bRJtzAzmsHWokvnTM
 aI3q6kDrY+Pch82T/dWGrvg0v+DrVlYkDpa2OgWpLPFC
X-Google-Smtp-Source: AGHT+IHBScY307pVlu3Lz9FsEk2twRbhYohVj9ShgIwetBqVhmpxMkiFIZ+o8KhgdbMV7KEKOpSSYA==
X-Received: by 2002:a17:907:3e13:b0:9dd:bfe4:21cb with SMTP id
 hp19-20020a1709073e1300b009ddbfe421cbmr696130ejc.5.1699429228538; 
 Tue, 07 Nov 2023 23:40:28 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 qx11-20020a170906fccb00b009b2f2451381sm598325ejb.182.2023.11.07.23.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 23:40:28 -0800 (PST)
Date: Wed, 8 Nov 2023 10:40:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Danilo Krummrich <me@dakr.org>
Message-ID: <f16bff0d-0653-4fd6-8086-74cd6cfa13f4@kadam.mountain>
References: <3554c52a-d500-4c8e-913f-c2a32a1f7a4d@moroto.mountain>
 <a5f0d138-413d-4a21-876a-c51b89caaca2@dakr.org>
 <0697cf1f-a763-4765-af74-5395bb895fdf@dakr.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0697cf1f-a763-4765-af74-5395bb895fdf@dakr.org>
Subject: Re: [Nouveau] [bug report] drm/nouveau/gsp/r535: add support for
 booting GSP-RM
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Nov 07, 2023 at 08:06:25PM +0100, Danilo Krummrich wrote:
> On 11/7/23 20:00, Danilo Krummrich wrote:
> > On 11/7/23 15:34, Dan Carpenter wrote:
> > > Hello Ben Skeggs,
> > > 
> > > The patch 176fdcbddfd2: "drm/nouveau/gsp/r535: add support for
> > > booting GSP-RM" from Sep 19, 2023 (linux-next), leads to the
> > > following Smatch static checker warning:
> > > 
> > >     drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1016 r535_gsp_rpc_unloading_guest_driver()
> > >     warn: 'rpc' isn't an ERR_PTR
> > > 
> > > drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> > >      1010 static int
> > >      1011 r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
> > >      1012 {
> > >      1013         rpc_unloading_guest_driver_v1F_07 *rpc;
> > >      1014
> > >      1015         rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_UNLOADING_GUEST_DRIVER, sizeof(*rpc));
> > > 
> > > nvkm_gsp_rpc_get() returns NULL on error.
> > 
> > There are also code paths where it can return an ERR_PTR. I think we need to check for IS_ERR_OR_NULL()...
> 
> Sorry, this is wrong, I just saw that r535_gsp_cmdq_get() calls r535_gsp_cmdq_get()
> which returns an ERR_PTR. Put it neither handles the return value of
> r535_gsp_cmdq_get() as ERR_PTR nor does it pass it through.

Sorry, I wrote this bug report badly...  Let me just send a patch.

regards,
dan carpenter

