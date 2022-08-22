Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F8A59CB3C
	for <lists+nouveau@lfdr.de>; Mon, 22 Aug 2022 23:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680C7A4650;
	Mon, 22 Aug 2022 21:59:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EB6A4640
 for <nouveau@lists.freedesktop.org>; Mon, 22 Aug 2022 21:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661205541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XGEm15n5GWeNNUVuIt05Qnj5H69sDv7gsn4H+W/WGZA=;
 b=AxqjT00U5W6Lv0kzDt9LZRcNyZ/gFKufu4484VaGbyR0nikU0te4sD8zdiPvenc4z0KIlg
 riyV9WJkplvbfRP1JcN+R/OujfUfNDEZvA/bfizUVhv7k3dbdZ82EQwu1mehG3eo9BTt4v
 tHFyWRoE+6/vruGoARaFx/pKbKhORiw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-244-AlMiXAgGPlCU_u3nZ_X_bw-1; Mon, 22 Aug 2022 17:59:00 -0400
X-MC-Unique: AlMiXAgGPlCU_u3nZ_X_bw-1
Received: by mail-qv1-f72.google.com with SMTP id
 c1-20020a0cfb01000000b00495ad218c74so6310292qvp.20
 for <nouveau@lists.freedesktop.org>; Mon, 22 Aug 2022 14:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=XGEm15n5GWeNNUVuIt05Qnj5H69sDv7gsn4H+W/WGZA=;
 b=djV1y9LYhTsOLHVvdISNqesD14fxTN389D7mZbDYQKebfzsdQ8sJcEXUCbv6e6E2dA
 N91JaEtRzTl+Mca1eQU059fz7Bu6G3Z8HLdhput8ro8QPATxLEG8S0nIlIt/MueKGnyW
 N/xTgdWRdNp660iIW6/UamJTEr0qVJATdX22/3DAEMUdhPIv3NVMIP+IRTGhnxOw2k7u
 uFfr2yOgqplyufK9LZazR97MP72c3J3tCKD5lKQV0Pbo21qJtxjCGJVPyHZXHIZpsBEd
 QjWQQaTKUqP5vhX33kJXGrRBziSasHy87zkxWyu4rN+blleLfCGSqMGmXOhlCJUQvlWv
 lofw==
X-Gm-Message-State: ACgBeo3QnPAqEsvyO86CtZvKBZYjt8Ohe8vvsVXLLwjeqKNttOscgiE+
 6XPJ9po0sHt/5trYKCMecam2YpicrgRRl8N6n/HkJpkqcngMygphAXOv3o5yFjhJ14GKr6M675Z
 vCdjA11pRidmTuTHJwqRMEbB+Yg==
X-Received: by 2002:ad4:5dc4:0:b0:496:d756:5bfd with SMTP id
 m4-20020ad45dc4000000b00496d7565bfdmr8495885qvh.111.1661205539823; 
 Mon, 22 Aug 2022 14:58:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4TmzP0yqY06vOr2ScRas4WIS/SPDdYFn+T/0unRQi+pHoPJOawWabaAaQgH6AtdYzOavBqJA==
X-Received: by 2002:ad4:5dc4:0:b0:496:d756:5bfd with SMTP id
 m4-20020ad45dc4000000b00496d7565bfdmr8495875qvh.111.1661205539622; 
 Mon, 22 Aug 2022 14:58:59 -0700 (PDT)
Received: from [192.168.8.139] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 z15-20020a05622a060f00b0034308283775sm10368904qta.21.2022.08.22.14.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 14:58:58 -0700 (PDT)
Message-ID: <bbe294752e8af13cb8b2975ba4edf53ab28e69cb.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Beniamin Sandu <beniaminsandu@gmail.com>, bskeggs@redhat.com, 
 kherbst@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Date: Mon, 22 Aug 2022 17:58:57 -0400
In-Reply-To: <20220815104028.381271-1-beniaminsandu@gmail.com>
References: <20220815104028.381271-1-beniaminsandu@gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/hwmon: use simplified
 HWMON_CHANNEL_INFO macro
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks! I will push this upstream in a moment

On Mon, 2022-08-15 at 13:40 +0300, Beniamin Sandu wrote:
> This makes the code look cleaner and easier to read.
> 
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_hwmon.c | 85 +++++--------------------
>  1 file changed, 17 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> index 1c3104d20571..a7db7c31064b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> @@ -211,75 +211,24 @@ static const struct attribute_group temp1_auto_point_sensor_group = {
>  
>  #define N_ATTR_GROUPS   3
>  
> -static const u32 nouveau_config_chip[] = {
> -	HWMON_C_UPDATE_INTERVAL,
> -	0
> -};
> -
> -static const u32 nouveau_config_in[] = {
> -	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_LABEL,
> -	0
> -};
> -
> -static const u32 nouveau_config_temp[] = {
> -	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
> -	HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_EMERGENCY |
> -	HWMON_T_EMERGENCY_HYST,
> -	0
> -};
> -
> -static const u32 nouveau_config_fan[] = {
> -	HWMON_F_INPUT,
> -	0
> -};
> -
> -static const u32 nouveau_config_pwm[] = {
> -	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> -	0
> -};
> -
> -static const u32 nouveau_config_power[] = {
> -	HWMON_P_INPUT | HWMON_P_CAP_MAX | HWMON_P_CRIT,
> -	0
> -};
> -
> -static const struct hwmon_channel_info nouveau_chip = {
> -	.type = hwmon_chip,
> -	.config = nouveau_config_chip,
> -};
> -
> -static const struct hwmon_channel_info nouveau_temp = {
> -	.type = hwmon_temp,
> -	.config = nouveau_config_temp,
> -};
> -
> -static const struct hwmon_channel_info nouveau_fan = {
> -	.type = hwmon_fan,
> -	.config = nouveau_config_fan,
> -};
> -
> -static const struct hwmon_channel_info nouveau_in = {
> -	.type = hwmon_in,
> -	.config = nouveau_config_in,
> -};
> -
> -static const struct hwmon_channel_info nouveau_pwm = {
> -	.type = hwmon_pwm,
> -	.config = nouveau_config_pwm,
> -};
> -
> -static const struct hwmon_channel_info nouveau_power = {
> -	.type = hwmon_power,
> -	.config = nouveau_config_power,
> -};
> -
>  static const struct hwmon_channel_info *nouveau_info[] = {
> -	&nouveau_chip,
> -	&nouveau_temp,
> -	&nouveau_fan,
> -	&nouveau_in,
> -	&nouveau_pwm,
> -	&nouveau_power,
> +	HWMON_CHANNEL_INFO(chip,
> +			   HWMON_C_UPDATE_INTERVAL),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT |
> +			   HWMON_T_MAX | HWMON_T_MAX_HYST |
> +			   HWMON_T_CRIT | HWMON_T_CRIT_HYST |
> +			   HWMON_T_EMERGENCY | HWMON_T_EMERGENCY_HYST),
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT),
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT |
> +			   HWMON_I_MIN | HWMON_I_MAX |
> +			   HWMON_I_LABEL),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
> +	HWMON_CHANNEL_INFO(power,
> +			   HWMON_P_INPUT | HWMON_P_CAP_MAX | HWMON_P_CRIT),
>  	NULL
>  };
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

