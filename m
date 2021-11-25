Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53651460523
	for <lists+nouveau@lfdr.de>; Sun, 28 Nov 2021 08:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525146EC0F;
	Sun, 28 Nov 2021 07:34:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A19F6EE14
 for <nouveau@lists.freedesktop.org>; Thu, 25 Nov 2021 13:26:55 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id e11so12432772ljo.13
 for <nouveau@lists.freedesktop.org>; Thu, 25 Nov 2021 05:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Gxl3XvhS3jy/Vg4tNUDSLVXMW/QY1KlnmAlTBNyzUmw=;
 b=Z0idp8uhQ9AsUuYWi2RnXFNxiSFeD/SgsFtNGz10ZBJzP7SsQtNgnkZLl/0Yq6zw88
 ZtfWmpPkursnohrG1+gdmVYyX+4ItJgd/a3eYJ8N668kcslwO1r1ZELpeljaLyoGtHT3
 ONQcpMAQhkdGCAiAKUqSzvyYfmJqCUR8U2VdpKiSaK3DNepZx5z6BX2s2ozokIcJIZeR
 9zG5NwH6IbCEJ6xEGZrbe3YkP7d9J3sLxLtwUNLhKBX2vF21orTi+1TKC0oNNfK2T4K5
 F+QSOhdkG7MyzKuaVEkIkoA83s5Na6NAXGf2NjKR90pY8sDx13MpmxC9g4RebyrmUKsy
 5moA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gxl3XvhS3jy/Vg4tNUDSLVXMW/QY1KlnmAlTBNyzUmw=;
 b=NfpMcIgJpvP5eULujRpvUxIhq1tUpkj/AtEq0aILCofgWomUjY4cRJuTI9SNWanoa+
 yVQC7zT+lax6TLCUvkYal+aZfRfWVxyNxLspeLPTjPWU2kBmLS6hlUHa1NmSC7/XNqQg
 XGVrg4qs8rbS761QN/z263OclfGJ8NK+enSS/LcN+2TZsjsfI9xu4mdX2y4WBoEQy+fI
 c9FFNc3wUYiflcLyJw29bXUqYaQrXP24CzCjwYJ6XdsMeX8AKxOFX7hsX8oSHHWHM22v
 FwTqD8HTvD5jPz+jdj7rVk4y6eUBBMJV/jGQtk0/Ol/Q1TXvf/0vUfFvIKlYJpVqesjJ
 mksw==
X-Gm-Message-State: AOAM532JG5uowUlQaUJnzGM4V6lUexyirWYll66pJhK4xRbix/gTMk5u
 o8IQyEzOQLjq7mmD1r1RPRovDg==
X-Google-Smtp-Source: ABdhPJzk0rkyZtS6FTgYDoC1LTJrxi0JVWAKHJVNqgGa3UJSxIleCmDGIlTtkxqSRMXBy9YzDuv34g==
X-Received: by 2002:a2e:9a05:: with SMTP id o5mr24471640lji.488.1637846813476; 
 Thu, 25 Nov 2021 05:26:53 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id k14sm229478ljk.57.2021.11.25.05.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 05:26:53 -0800 (PST)
To: Claudio Suarez <cssk@net-c.es>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, ville.syrjala@linux.intel.com
References: <20211016184226.3862-1-cssk@net-c.es>
 <20211016184226.3862-8-cssk@net-c.es>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <32c14b83-c5ee-1690-525d-8cf3d02a2394@linaro.org>
Date: Thu, 25 Nov 2021 16:26:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211016184226.3862-8-cssk@net-c.es>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 28 Nov 2021 07:34:49 +0000
Subject: Re: [Nouveau] [PATCH v2 07/13] drm/msm: replace
 drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
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

On 16/10/2021 21:42, Claudio Suarez wrote:
> Once EDID is parsed, the monitor HDMI support information is available
> through drm_display_info.is_hdmi. Retriving the same information with
> drm_detect_hdmi_monitor() is less efficient. Change to
> drm_display_info.is_hdmi
> 
> Signed-off-by: Claudio Suarez <cssk@net-c.es>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_connector.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> index 58707a1f3878..07585092f919 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> @@ -364,8 +364,8 @@ static int msm_hdmi_connector_get_modes(struct drm_connector *connector)
>   
>   	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl);
>   
> -	hdmi->hdmi_mode = drm_detect_hdmi_monitor(edid);
>   	drm_connector_update_edid_property(connector, edid);
> +	hdmi->hdmi_mode = connector->display_info.is_hdmi;
>   
>   	if (edid) {
>   		ret = drm_add_edid_modes(connector, edid);
> 


-- 
With best wishes
Dmitry
