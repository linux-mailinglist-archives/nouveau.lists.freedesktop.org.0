Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A0277F0D6
	for <lists+nouveau@lfdr.de>; Thu, 17 Aug 2023 09:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8943510E1A3;
	Thu, 17 Aug 2023 07:03:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4314810E044;
 Sun, 13 Aug 2023 01:14:57 +0000 (UTC)
Received: from [192.168.2.249] (109-252-150-127.dynamic.spd-mgts.ru
 [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F222866071B8;
 Sun, 13 Aug 2023 02:14:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691889295;
 bh=bPp/hkEoDS0ZxAQiv7IPH0ePMv+YAdVNwR7xflkKTfA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Uz8KDonPc/gBgbinrFzsCdc6rgNcwCbXiIogKVRXysqJJtxOGqNEF2OUOR+rVnrXd
 VwOSU59ZkqE9I2R9CNOpO28dhmbVc2RZcZcaxEONC0OAH+wxz6POH8Rza1irhAgWQX
 3jNxUqWp9qemwwuadE6DSax0voEzK6ad/MwWNwyqoUmdMClJ0GuN+GntG6o/Y2+G20
 US0ec6J00OLr7/jjIhU8IlmjV5yvwReELAfpnaFBKL055tF1xHd83m+Q1gCsxqJfu1
 GvuSjjhWUWtbQvALG3p1XUa66zNV9izcGryYx+W8Bq2+CW9UGz0xQnSZk7uepiAzPw
 5WLxzXW8kcnpw==
Message-ID: <325014e7-cb8d-54e0-eead-7727c8ec2f07@collabora.com>
Date: Sun, 13 Aug 2023 04:14:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Ruan Jinjie <ruanjinjie@huawei.com>, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 sean@poorly.run, marijn.suijten@somainline.org, bskeggs@redhat.com,
 kherbst@redhat.com, lyude@redhat.com, kraxel@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com,
 paulo.miguel.almeida.rodenas@gmail.com, wenjing.liu@amd.com,
 haoping.liu@amd.com, Charlene.Liu@amd.com, chiahsuan.chung@amd.com,
 george.shen@amd.com, sancchen@amd.com, tony.tascioglu@amd.com,
 jaehyun.chung@amd.com, tales.aparecida@gmail.com, drv@mailo.com,
 aurabindo.pillai@amd.com, quic_vpolimer@quicinc.com, jiasheng@iscas.ac.cn,
 noralf@tronnes.org, jose.exposito89@gmail.com, javierm@redhat.com,
 mairacanal@riseup.net, davidgow@google.com, arthurgrillo@riseup.net,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux-foundation.org
References: <20230809034445.434902-1-ruanjinjie@huawei.com>
 <20230809034445.434902-6-ruanjinjie@huawei.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230809034445.434902-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 17 Aug 2023 07:02:58 +0000
Subject: Re: [Nouveau] [PATCH -next 5/7] drm/virtio: Remove an unnecessary
 NULL value
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

On 8/9/23 06:44, Ruan Jinjie wrote:
> The NULL initialization of the pointer assigned by kzalloc() first is
> not necessary, because if the kzalloc() failed, the pointer will be
> assigned NULL, otherwise it works as usual. so remove it.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
> index 3c00135ead45..82563dbec2ab 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
> @@ -274,7 +274,7 @@ static int virtio_gpu_fence_event_create(struct drm_device *dev,
>  					 struct virtio_gpu_fence *fence,
>  					 u32 ring_idx)
>  {
> -	struct virtio_gpu_fence_event *e = NULL;
> +	struct virtio_gpu_fence_event *e;
>  	int ret;
>  
>  	e = kzalloc(sizeof(*e), GFP_KERNEL);

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

