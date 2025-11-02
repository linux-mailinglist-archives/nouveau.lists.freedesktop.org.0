Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0361CBAC97
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D8D10EB9E;
	Sat, 13 Dec 2025 12:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MofBD+Fv";
	dkim=permerror (0-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRSNp+A4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870B110E1DC
 for <nouveau@lists.freedesktop.org>; Sun,  2 Nov 2025 16:39:30 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A2FuMZF501657
 for <nouveau@lists.freedesktop.org>; Sun, 2 Nov 2025 16:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Vsudp5PRE81p+UL97II9GrFo
 Q82PxOzVdfpShaNANXY=; b=MofBD+FvgCKPFuq3/UZeyNcPO7m4lbnHivOxOn7h
 /9eQpsVBicILU9Wyi7oVMysvN7k7Mw9FwfT4cK38MU7Xn9j/1v/0p6/Jf6+/PVhO
 gWjMNLjyOeisd7CIbEtHAh3y7coy+AFabvbvPQNy5jnA6RaGEUMgR++iZmAmLSpe
 FcF9U8T7xzAOGwsxol6eOhhJkNqSmZlDbcZrzrZiAZn9Ez/KyqbMLuBybNFobZGt
 AKrAXmbeaQ/JJrjNAqJO71reaAmJEanyzsfP6lFJkKGi84AHIyY/ZHYgjIvjNIlD
 VzG8fDkGWx/j74iJT8C/kUi3FZfSjsTjW7BgeK1e/d4lMA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ae32bps-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <nouveau@lists.freedesktop.org>; Sun, 02 Nov 2025 16:39:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ecf77618a5so121879761cf.3
 for <nouveau@lists.freedesktop.org>; Sun, 02 Nov 2025 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762101569; x=1762706369;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
 b=hRSNp+A4rURFK3/QMyUxwEiEjZb04aqoiYUoIhcFDOpeBBIUtDCbEKFKNupBl+WDhe
 ZfUPTWiaDrTjBsZOWSBreKinLG2ysI/X270daDOoR1VyGm5dvTuy3jQhyf9kcxD83p8c
 8zA/anwFgRb88goQuH7KMuJEYw6zqSIfwrjzpoZAWXrdeLTMQM7e7InUOltntsx+s3vV
 nD/BxqXRUBOa4RU9IKUg8q4fA50OKD4Pd6akNYEeSC1vRnwD8lYaTJsUh0bUsJPAYA2o
 weUXYvWUfPod0zUiPoPCWG/N8l4sGFF+Iik3r7ewm+CB5q5iKOmJrrsa25fhTQ8xp3q9
 CQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762101569; x=1762706369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
 b=Ji0y8lpf7c40eSv0MTikJ5E41YTOjQseBIRGgzmHbX9RqnPd+70ytGX++76IDs2d4h
 EeEbCiB+jhKskEJeDC1fZLVgFf547Ymzuk+JaUTYw+cL7FdJJ1tAVd6cMVYNjDV01GUN
 tMxWRWOXuOauUQl3z3AsTTPHy6ZvOfAusefC8ZikOF10104y4URnCI23RKF5DixCCIkh
 yU9N5G0fe+Jky6DHgPKK+NJJaCSptJz10/91P4+r5cRM1SQpg/pZFyCL33ZxH+BXgOd6
 BLarTQc7Xe8dzmIVTCS1zzTlHhtokXla/nrTP9nb9R2+c3FV7oI/2xL83pmU9k3xBiJt
 yvig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTQ2cbPsID4b81RmMokpd5QEt8kB8pbt6veLCqcD+VJ+JwdMNqPRW71X76gSxq2SnSNjuuklDE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykTSdu3OU1tmZNU/fl2oXcsTDsprIbbOVkoqw8F0Lexz9G36mh
 pEKzEugf3wpwNz3AFjWLosjON9mLBWOgCwUq7t97ef7vS3aRsfax2XC3J6iIcP3UodNs7T2eDaF
 N6hJW1s0cwP3hjqk9Ml0lPwmIxOVmZP73MRsaD6y0wA0TvjAY8naDTW+WA+vfBn84uwzT
X-Gm-Gg: ASbGncsPFFd2E957NbgZwhP9YgxfoaYN9DQhscFr953+xu7F4ZwgEpsmTax/jEKRcze
 tuzU54zyWbWYhUbqafVEnwTKJ3xOPbfw5L9KLV7+qkva7S0BJ7Y+VaRwJWgcUbB6ewTZ3KsPpBZ
 /ygDjqLZe3dZAypdvl8+MJFDtbBBZVs4rZe6XeSRgMhiU26oofib86ELswf8AiUVOFdmSLKqtjW
 Q6P/xDNUgVVvBy8wFuA+2U/amg2BGxrQa2HF2xdAVC2twrm0zJU712VThREl2ijunbEZuzdkmN9
 yjgyTPgq1OXlxVvjKohEv4AGCgGXWLHxsYNJB1BxvRdbdFfq2YbY+yX/9EEEWZ0p3yJKIxqBrsj
 vnlzP7t1UpKvFO6bj+t8ZiW7OXbBa1mB5YiKASDlWxnsNbbaUyBQEJODgMD5yGe1lVNKBhT8iEk
 aaxDSDR+f+G5fQ
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id
 d75a77b69052e-4ed423d4eccmr57411281cf.54.1762101568705; 
 Sun, 02 Nov 2025 08:39:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBDCWJDKPzqxu7f2En5m/zHiJp5IOVrgHqGPH6qz1rOivQAZXaoWbSK0Fgiw9Mg8qUeB+6cA==
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id
 d75a77b69052e-4ed423d4eccmr57410861cf.54.1762101568242; 
 Sun, 02 Nov 2025 08:39:28 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-594282be8adsm789469e87.51.2025.11.02.08.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 08:39:27 -0800 (PST)
Date: Sun, 2 Nov 2025 18:39:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v6 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <vptw5tquup34e3jen62znnw26qe76f3pys4lpsal5g3czwev6y@2q724ibos7by>
References: <20250821081918.79786-1-tzimmermann@suse.de>
 <20250821081918.79786-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821081918.79786-14-tzimmermann@suse.de>
X-Proofpoint-ORIG-GUID: xx2qwB4Uu-DhiFTzoldniAfY1Dq1Nrhb
X-Proofpoint-GUID: xx2qwB4Uu-DhiFTzoldniAfY1Dq1Nrhb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE1NCBTYWx0ZWRfXxNnVLJffXYjd
 J+fuqtyRZEm/DMOf6I0MoDZE5hdzZoJi3Qt4TVPAeQz9j2FbUv3TzFHlmy0i15JRgr9s3cEK7gi
 BJQEtF3qtP0oBPTvB1/FKJ1AGZyBdV03BI0ALtOpE7iwBLhFZP1zSHIIqwMI+myz/gw+sfrtH4z
 2zb00Wd+/vzF2XMzRk4stoosSnzI3sdEb4JX8KD4M+kpVIhEu27LQVGLimMvOkaSS0eGlEsfRG3
 8A2v6rHPhSQ9zSpE1UJd4z9+xvX+4VI3kQ/7dyM6Zz8DidHDgKBf5ibiKyWWE8qrK9Mo1LLfssl
 y/szlmC7q7zQi2Y/admoDrvTscxcXn1NYOI5YhGDX207UN44EiVP91FJ07Q08siBV/FEFIqMVIU
 CFrJFyF8Qt1Tt64SlY2iV6id7mN/hA==
X-Authority-Analysis: v=2.4 cv=CfUFJbrl c=1 sm=1 tr=0 ts=69078941 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8
 a=4vBwfh3hQKJL6CJddaEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020154
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:46 +0000
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

On Thu, Aug 21, 2025 at 10:17:20AM +0200, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
> and buffer size. Alignment is specified in bytes, but the hardware
> requires the scanline pitch to be a multiple of 32 pixels. Therefore
> compute the byte size of 32 pixels in the given color mode and align
> the pitch accordingly. This replaces the existing code in the driver's
> align_pitch() helper.
> 
> v3:
> - clarify pitch alignment in commit message (Dmitry)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

This broke kms_getfb@getfb-reject-nv12 and kms_getfb@getfb2-accept-nv12
IGT tests. I'll submit a fix separately.

-- 
With best wishes
Dmitry
